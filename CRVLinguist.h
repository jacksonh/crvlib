//
//  CRVLinguist.h
//  codereview
//
//  Created by Jackson Harper on 12/18/13.
//  Copyright (c) 2013 Harper Semiconductors, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CRVDiffFile;



@interface CRVLinguist : NSObject

+ (BOOL)isGeneratedFile:(CRVDiffFile *)file;

@end

