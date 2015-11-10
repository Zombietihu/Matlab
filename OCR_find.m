I= imread('heavy_metal.bmp');
ocrResults = ocr(I);
recognizedText = ocrResults.Text;
figure, imshow(I);
text(600, 150, recognizedText, 'BackgroundColor', [1,1,1]);