//
//  Define.m
//  MemorialService
//
//  Created by pc131101 on 2014/01/11.
//  Copyright (c) 2014年 DIGITALSPACE WOW. All rights reserved.
//

#import "Define.h"

@implementation Define

/* #efefef */
const float TITLE_BG_COLOR_RED   = 0.937;
const float TITLE_BG_COLOR_GREEN = 0.937;
const float TITLE_BG_COLOR_BLUE  = 0.937;

/* #b2cbe4 */
const float TOOLBAR_BG_COLOR_RED   = 0.698;
const float TOOLBAR_BG_COLOR_GREEN = 0.796;
const float TOOLBAR_BG_COLOR_BLUE  = 0.894;

/* #efefef */
const float MENU_BG_COLOR_RED   = 0.937;
const float MENU_BG_COLOR_GREEN = 0.937;
const float MENU_BG_COLOR_BLUE  = 0.937;

/* #f8f4e6 */
const float TEXTVIEW_BG_COLOR_RED   = 0.973;
const float TEXTVIEW_BG_COLOR_GREEN = 0.957;
const float TEXTVIEW_BG_COLOR_BLUE  = 0.902;

const float TEXT_COLOR_RED   = 0.141;
const float TEXT_COLOR_GREEN = 0.078;
const float TEXT_COLOR_BLUE  = 0.055;

NSString *const KEY_DEVICE_TOKEN = @"device_token";

NSString *const LOCALIZE_FILE = @"fixedSentenceKazuya";

NSString *const MORTICIAN_NAME    = @"有限会社かずや";
NSString *const MORTICIAN_POST    = @"865-0023";
NSString *const MORTICIAN_ADDRESS = @"熊本県玉名市大倉1408-1";
NSString *const MORTICIAN_TEL     = @"0968-73-3420";
NSString *const MORTICIAN_URL     = @"http://www.kazuya-group.com/ß";

/*タクシー会社_メールアドレス*/
NSString * const TAXI_MAIL_ADDRESS = @"yamayamato8@gmail.com";   //テスト用

//Notification名
NSString *const NOTICE_BARCODE_DOWNLOADED = @"barcode_image_download_complete";

//EC機能フラグ
const bool IS_EC_ACTIVE = YES;

//ポイント機能フラグ
const bool IS_POINT_ACTIVE = YES;

/*店舗情報_地図*/
NSString * const MAP_PIN_TITLE  = @"日本葬儀社";                         //テスト用

/* 法要アプリWeb-API URL */
NSString *const SAVE_DEVICE_TOKEN  = @"http://ms-dev.memorial-site.net/Cooperation/saveiosdevicetoken";
NSString *const SAVE_DEVICE_TOKEN_AND_DECEASED_ID = @"http://ms-dev.memorial-site.net/Cooperation/saveiosdevicetokenanddeceasedid";
NSString *const GET_NOTICE_INFO    = @"http://ms-dev.memorial-site.net/Cooperation/getnoticeinfo";
NSString *const VIEW_NOTICE_INFO   = @"http://ms-dev.memorial-site.net/mng/viewnoticeinfo";
NSString *const GET_NOTICE_INFO_TOKEN = @"http://ms-dev.memorial-site.net/Cooperation/getnoticeinfoanddeceasedid";
NSString *const READ_TRANSFER_DATA = @"http://ms-dev.memorial-site.net/Cooperation/readtranseferdata";
NSString *const DOWNLOAD_PHOTO     = @"http://ms-dev.memorial-site.net/cooperation/downloadphoto";
NSString *const SEND_DATA_KEY_MAIL = @"http://ms-dev.memorial-site.net/Cooperation/senddatakeymailios";
NSString *const GET_NOTICE_INFO_DELIVERED = @"http://ms-dev.memorial-site.net/cooperation/getnoticeinfodelivered";
NSString *const GET_NOTICE_INFO_DELIVERED_TOKEN = @"http://ms-dev.memorial-site.net/cooperation/getnoticeinfodeliveredbytoken";
NSString *const SEND_MEMORIAL_MAIL = @"http://ms-dev.memorial-site.net/Cooperation/sendmemorialmailios";
NSString *const SAVE_TRANSFER_DATA = @"http://ms-dev.memorial-site.net/cooperation/savetransferdata";
NSString *const UP_PHOTO = @"http://ms-dev.memorial-site.net/cooperation/upphoto";
NSString *const SYUKATSU = @"http://ms-dev.memorial-site.net/Cooperation/syukatsuios";
NSString *const READ_DECEASED_DATA = @"http://ms-dev.memorial-site.net/cooperation/readdeceaseddata";

/* ポイント機能Web-API URL */
NSString *const POINT_ADD_USER    = @"http://ms-dev.memorial-site.net/cooperation/addpointuser";
NSString *const POINT_ADD_USER1   = @"http://ms-dev.memorial-site.net/cooperation/addautoaddpoint1";
NSString *const POINT_ADD_USER2   = @"http://ms-dev.memorial-site.net/cooperation/addautoaddpoint2";
NSString *const POINT_ADD_USER3   = @"http://ms-dev.memorial-site.net/cooperation/addautoaddpoint3";
NSString *const POINT_ADD_USER4   = @"http://ms-dev.memorial-site.net/cooperation/addautoaddpoint4";
NSString *const POINT_UPDATE_USER = @"http://ms-dev.memorial-site.net/cooperation/updatepersonalinfo";
NSString *const POINT_GET_USER    = @"http://ms-dev.memorial-site.net/cooperation/getpersonalinfo";
NSString *const SEARCH_ADDRESS    = @"http://point.memorial-site.net/point/getaddressfrompostalcode";
NSString *const GET_BARCODE       = @"http://point.memorial-site.net/point/generatebarcode";

/* 家系図機能Web-API URL */
NSString *const DESEASE_LIST_INSERT = @"http://wow-d.net/Family_Tree/orderpage/deceasedlistarrayinsert";
NSString *const DESEASE_LIST_DELETE = @"http://wow-d.net/Family_Tree/orderpage/deceasedlistarraydelete";


@end
