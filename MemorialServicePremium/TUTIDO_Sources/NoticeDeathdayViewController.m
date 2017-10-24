//
//  NoticeDeathdayViewController.m
//  MemorialService
//
//  Created by pc131101 on 2014/02/04.
//  Copyright (c) 2014年 DIGITALSPACE WOW. All rights reserved.
//

#import "NoticeDeathdayViewController.h"
#import "AppDelegate.h"
#import "Define.h"
#import "DatabaseHelper.h"
#import "UserDao.h"
#import "User.h"
#import "DeceasedDao.h"
#import "Deceased.h"
#import "Common.h"

@interface NoticeDeathdayViewController ()

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property (weak, nonatomic) IBOutlet UIScrollView *noticeScroll;
@property (weak, nonatomic) IBOutlet UIView *noticeScrollView;

@property (weak, nonatomic) IBOutlet UILabel *goyomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;
@property (weak, nonatomic) IBOutlet UILabel *morticianLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIButton *telButton;
@property (weak, nonatomic) IBOutlet UILabel *morticianHoleName;
@property (weak, nonatomic) IBOutlet UILabel *morticianHoleAddress;
@property (weak, nonatomic) IBOutlet UIButton *morticianTwoTelButton;
@property (weak, nonatomic) IBOutlet UILabel *morticianTwoAddressLabel;

@end

@implementation NoticeDeathdayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //解像度に合わせてViewサイズを変更
    [self.view setFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    
    //スクロールのため、height値をプラス
    float width = [[UIScreen mainScreen]bounds].size.width;
    float height = [[UIScreen mainScreen]bounds].size.height+500;
    
    //UIScrollViewのコンテンツサイズを設定
    self.noticeScroll.contentSize = CGSizeMake(width,height);
    //スクロールバーを表示
    self.noticeScroll.showsVerticalScrollIndicator = YES;
    
    //ツールバーの背景色と文字色を設定
    self.toolBar.barTintColor = [UIColor colorWithRed:TOOLBAR_BG_COLOR_RED green:TOOLBAR_BG_COLOR_GREEN blue:TOOLBAR_BG_COLOR_BLUE alpha:1.0];
    self.toolBar.tintColor = [UIColor colorWithRed:TEXT_COLOR_RED green:TEXT_COLOR_GREEN blue:TEXT_COLOR_BLUE alpha:1.0];

    //DBから故人情報、葬儀社情報を取得
    //データベースに接続
    DatabaseHelper *databaseHelper = [[DatabaseHelper alloc]init];
    FMDatabase *memorialDatabase = databaseHelper.memorialDatabase;
    //故人情報を取得
    DeceasedDao *deceasedDao = [DeceasedDao deceasedDaoWithMemorialDatabase:memorialDatabase];
    Deceased *deceased = [deceasedDao selectDeceasedByDeceasedNo:self.notification.deceased_no];
    
    //QRコードから読み込んだ故人様情報が存在するかチェック
    BOOL boolQrDeceased = deceasedDao.existenceQrDeceased;
    
    //データーベースを閉じる
    [memorialDatabase close];
    
    //１週間前通知の場合、7日足した日時、前日通知の場合、１日足した日時を取得
    NSDate *deathday;
    if (self.notification.notice_kind == NOTICE_DEATHDAY_1WEEK_BEFORE) {
        deathday = [Common getAddDateDay:7 withDate:self.notification.notice_date];
    } else if (self.notification.notice_kind == NOTICE_DEATHDAY_BEFORE) {
        deathday = [Common getAddDateDay:1 withDate:self.notification.notice_date];
    } else if (self.notification.notice_kind == NOTICE_DEATHDAY) {
        deathday = self.notification.notice_date;
    }

    //画面に設定する
    //通知メッセージ
    self.noticeLabel.text = [NSString stringWithFormat:@"%@は、%@様の命日でございます。", [Common getDateString:@"MM月dd日(EEE)" convDate:deathday], deceased.deceased_name];
    
    if (boolQrDeceased) {
        //葬儀社情報が存在する場合
        //ホール名
        self.morticianHoleName.text = MORTICIAN_HOLL_NAME;
        //住所
        self.morticianHoleAddress.text = MORTICIAN_ADDRESS;
        [self.morticianHoleAddress setNumberOfLines:0];
        [self.morticianHoleAddress sizeToFit];
        //電話番号
        [self.telButton setTitle:MORTICIAN_TEL forState:UIControlStateNormal];
        //葬儀社名
        self.morticianLabel.text = MORTICIAN_NAME;
        //住所
        self.morticianTwoAddressLabel.text = MORTICIAN_TWO_ADDRESS;
        [self.morticianTwoAddressLabel setNumberOfLines:0];
        [self.morticianTwoAddressLabel sizeToFit];
        //電話番号
        [self.morticianTwoTelButton setTitle:MORTICIAN_TWO_TEL forState:UIControlStateNormal];

    } else {
        //葬儀社情報が存在しない場合
//        //ご用命メッセージ
//        self.goyomeLabel.hidden = YES;
//        //葬儀社名
//        self.morticianLabel.hidden = YES;
//        //郵便番号
//        self.postLabel.hidden = YES;
//        //住所
//        self.addressLabel.hidden = YES;
//        //電話番号
//        self.telButton.hidden = YES;
//        //URL
//        self.urlButton.hidden = YES;;

        //ホール名
        self.morticianHoleName.text = MORTICIAN_HOLL_NAME;
        //住所
        self.morticianHoleAddress.text = MORTICIAN_ADDRESS;
        [self.morticianHoleAddress setNumberOfLines:0];
        [self.morticianHoleAddress sizeToFit];
        //電話番号
        [self.telButton setTitle:MORTICIAN_TEL forState:UIControlStateNormal];
        //葬儀社名
        self.morticianLabel.text = MORTICIAN_NAME;
        //住所
        self.morticianTwoAddressLabel.text = MORTICIAN_TWO_ADDRESS;
        [self.morticianTwoAddressLabel setNumberOfLines:0];
        [self.morticianTwoAddressLabel sizeToFit];
        //電話番号
        [self.morticianTwoTelButton setTitle:MORTICIAN_TWO_TEL forState:UIControlStateNormal];

    }
}

//電話番号クリック時(つくばみらい)
- (IBAction)telButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.telButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//電話番号クリック時(本社)
- (IBAction)telButtonPushedTwo:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.morticianTwoTelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}


//ホームページへボタンタップ時
- (IBAction)pushUrl:(id)sender {
    NSString *urlString = MORTICIAN_URL;
    NSURL *url2 = [NSURL URLWithString:urlString];
    // URLをタップした場合
    [[UIApplication sharedApplication] openURL:url2];
}

//閉じるボタンクリック時
- (IBAction)appliOpenButtonPushed:(id)sender {
    if (self.noticeTiming == NOTICE_TIMING_ACTIVE) {
        //自画面を閉じる
        [self.view removeFromSuperview];
    } else if (self.noticeTiming == NOTICE_TIMING_PASSIVE) {
        //自画面を閉じる
        [self.view removeFromSuperview];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
