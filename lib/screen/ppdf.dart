import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFReaderApp extends StatelessWidget {
  PDFReaderApp({Key? key, required this.path, required this.title})
      : super(key: key);
  final String path, title;
  PdfViewerController pdfViewerController = PdfViewerController();
  double zoom = 0.0;
  TextEditingController controller = TextEditingController();
  int pageNo = 0;
  jumpTo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter page No to jump'),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (val) {
                pageNo = int.parse(val);
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    pdfViewerController.jumpToPage(pageNo);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                pdfViewerController.previousPage();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () {
                pdfViewerController.nextPage();
              },
              icon: const Icon(Icons.arrow_forward_ios)),
          IconButton(
              onPressed: () {
                jumpTo(context);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SfPdfViewer.asset(
        'assets/$path',
        controller: pdfViewerController,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                pdfViewerController.zoomLevel = zoom + 1;
                zoom++;
              },
              icon: const Icon(Icons.zoom_in)),
          IconButton(
              onPressed: () {
                pdfViewerController.zoomLevel = 0.0;
              },
              icon: const Icon(Icons.zoom_out))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
