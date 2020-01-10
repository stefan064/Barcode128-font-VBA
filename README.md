# Barcode128-font-VBA
VBA function for creating size-optimised Code128 barcodes with code128 font

Barcode128Auto() automatically switches between code128A, B and C modes as required to minimise the output barcode length.

The best length reduction comes from having 4 or more numeric digits in a row. Even numbers of digits also help, as do avoiding having a mix of lower case letters and control codes (e.g. tab, CRLF characters...) in the same barcode.
