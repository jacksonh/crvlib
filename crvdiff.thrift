
enum CRVDiffHunkLineType {
  Header,
  Contextual,
  Addition,
  Removal,
}       

enum CRVSpanStyle {
  Default,
  Comment,
  Keyword,
  Name,
  FunctionName,
  ClassName,
  String,
}

struct CRVDiffLine {
  1:  required string text,
  2:  required i32 lineWidth,
  3:  required i32 diffOffset,
  4:  required i32 newLineNumber,
  5:  required i32 origLineNumber,
  6:  required CRVDiffHunkLineType lineType,
}

struct CRVDiffFile {
  1:  required bool isBinary,
  2:  required i32 diffOffset,
  3:  required i32 maxLineWidth,
  4:  required i32 numberOfLines,
  5:  required i32 numberOfAdditions,
  6:  required i32 numberOfDeletions,
  7:  required string origFilePath,
  8:  required string newFilePath,
  9:  required list<CRVDiffLine> lines,
}

struct CRVDiff {
  1: required string uniqueId,
  2: required list<CRVDiffFile> files,
}

