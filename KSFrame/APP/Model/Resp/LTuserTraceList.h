//
//  LTuserTraceList.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-3.
//  Copyright (c) 2015年 HTY. All rights reserved.
//



@interface LTuserTraceList : KSRespBase
/* 
 {"total":2,"nextoffset":2,"records":[{"totalmoney":"4.00","totalcount":"2","id":"1846598","hddesc":"","start":"14110743","state":"\u5230\u671f\u505c\u6b62","lottype":"\u5feb\u4e50\u6251\u514b3","finishmoney":"4.00","hd":"0","getmoney":"0.00","finishcount":"2","row":"1"},{"totalmoney":"117.00","totalcount":"39","id":"1737108","hddesc":"\u6ee139\u671f\u8d60\u90014\u5143","start":"2014093","state":"\u5df2\u53d6\u6d88","lottype":"\u8d85\u7ea7\u5927\u4e50\u900f","finishmoney":"3.00","hd":"1","getmoney":"0.00","finishcount":"1","row":"2"}]}
 */
@property (nonatomic,copy) NSArray *records;
@property (nonatomic,copy) NSString *start;
@property (nonatomic,copy) NSString *getmoney;
@property (nonatomic,copy) NSString *lottype;
@property (nonatomic,copy) NSString *finishmoney;
@property (nonatomic,copy) NSString *finishcount;
@property (nonatomic,copy) NSString *totalcount;
@property (nonatomic,copy) NSString *totalmoney;
@property (nonatomic,copy) NSString *chase_id;
@property (nonatomic,copy) NSString *hd;
@property (nonatomic,copy) NSString *hddesc;
@end
