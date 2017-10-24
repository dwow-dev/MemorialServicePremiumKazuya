//
//  OtherFuneralViewController.m
//  MemorialService
//
//  Created by pc131101 on 2014/01/21.
//  Copyright (c) 2014年 DIGITALSPACE WOW. All rights reserved.
//

#import "OtherFuneralViewController.h"
#import "Define.h"

@interface OtherFuneralViewController ()

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property (weak, nonatomic) IBOutlet UIScrollView *funeralScroll;
@property (weak, nonatomic) IBOutlet UIView *funeralScrollView;

@property (weak, nonatomic) IBOutlet UILabel *morticianNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *morticianPostLabel;
@property (weak, nonatomic) IBOutlet UILabel *morticianAddressLabel;
@property (weak, nonatomic) IBOutlet UIButton *morticianTelButton;
@property (weak, nonatomic) IBOutlet UIButton *morticianHonsyaTelButton;
@property (weak, nonatomic) IBOutlet UIButton *morticianUrlButton;
@property (weak, nonatomic) IBOutlet MKMapView *storeMap;

//フローラ様用
@property (weak, nonatomic) IBOutlet UIButton *f_sakura_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_shibata_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_kawasaki_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_kakuda_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_shiroishi_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_watari_TelButton;

@property (weak, nonatomic) IBOutlet UIButton *f_souma_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_haranomachi_TelButton;

@property (weak, nonatomic) IBOutlet UIButton *f_takayama_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_hida_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_gero_TelButton;
@property (weak, nonatomic) IBOutlet UIButton *f_hagiwara_TelButton;

@end

@implementation OtherFuneralViewController

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
    
    //ツールバーの背景色と文字色を設定
    self.toolBar.barTintColor = [UIColor colorWithRed:TOOLBAR_BG_COLOR_RED green:TOOLBAR_BG_COLOR_GREEN blue:TOOLBAR_BG_COLOR_BLUE alpha:1.0];
    self.toolBar.tintColor = [UIColor colorWithRed:TEXT_COLOR_RED green:TEXT_COLOR_GREEN blue:TEXT_COLOR_BLUE alpha:1.0];
    
    //スクロールのため、height値をプラス
    float width = [[UIScreen mainScreen]bounds].size.width;
    float height = [[UIScreen mainScreen]bounds].size.height+100;
    
    //UIScrollViewのコンテンツサイズを設定
    self.funeralScroll.contentSize = CGSizeMake(width,height);
    //スクロールバーを表示
    self.funeralScroll.showsVerticalScrollIndicator = YES;
    
    
    // 地図のデリゲートを設定
    [self.storeMap setDelegate:self];
    
    // 位置の値
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = MAP_CENTER_LAT;
    coordinate.longitude = MAP_CENTER_LON;
    
    // ズームの値
    MKCoordinateSpan span;
    span.latitudeDelta = 0.006;
    span.longitudeDelta = 0.006;
    
    // ズームと位置の指定
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    [self.storeMap setRegion:region animated:YES];
    
    // ピン設定
    MKPointAnnotation* pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = CLLocationCoordinate2DMake(MAP_PIN_LAT, MAP_PIN_LON);
    pin.title = MAP_PIN_TITLE;
    [self.storeMap addAnnotation:pin];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //ラベルに葬儀社情報とプロパティを設定する
    //葬儀社名
    self.morticianNameLabel.text = MORTICIAN_NAME;
    //郵便番号
    self.morticianPostLabel.text = MORTICIAN_POST;
    //住所
    self.morticianAddressLabel.text = MORTICIAN_ADDRESS;
    [self.morticianAddressLabel setNumberOfLines:0];
    [self.morticianAddressLabel sizeToFit];
    //電話番号
    [self.morticianTelButton setTitle:MORTICIAN_TEL forState:UIControlStateNormal];
 
}



- (void)mapView:(MKMapView *)aMapView didAddAnnotationViews:(NSArray *)views {
    [self.storeMap selectAnnotation:[self.storeMap.annotations lastObject] animated:YES];
}

//戻るボタンクリック時
- (IBAction)returnButtonPushed:(id)sender {
    //上の階層に戻る
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)pushUrl:(id)sender {
    NSString *urlString = @"http://e-sousai.com/";
    NSURL *url2 = [NSURL URLWithString:urlString];
    // URLをタップした場合
    [[UIApplication sharedApplication] openURL:url2];
}

//電話番号クリック時
- (IBAction)telButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.morticianTelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//電話番号クリック時(本社)
- (IBAction)honsyatelButtonPushed:(id)sender {
    //電話番号をタッチした場合
//    NSString *tel_honsya = [self.morticianHonsyaTelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
//    NSString *telUrl_honsya= [NSString stringWithFormat:@"tel:%@", tel_honsya];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl_honsya]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:0297525040"]];
}


//ーーーーフローラ様用電話メソッドーーーー//
//フローラメモリアルホール桜
- (IBAction)f_sakura_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_sakura_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール柴田
- (IBAction)f_shibata_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_shibata_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール川崎
- (IBAction)f_kawasaki_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_kawasaki_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール角田
- (IBAction)f_kakuda_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_kakuda_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール白石
- (IBAction)f_shiroishi_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_shiroishi_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール亘理
- (IBAction)f_watari_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_watari_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール相馬
- (IBAction)f_souma_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_souma_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール原町
- (IBAction)f_haranomachi_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_haranomachi_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール高山
- (IBAction)f_takayama_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_takayama_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホールひだ
- (IBAction)f_hida_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_hida_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール下呂
- (IBAction)f_gero_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_gero_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

//フローラメモリアルホール萩原
- (IBAction)f_hagiwara_TelButtonPushed:(id)sender {
    //電話番号をタッチした場合
    NSString *tel = [self.f_hagiwara_TelButton.titleLabel.text stringByReplacingOccurrencesOfString: @"-" withString: @""];
    NSString *telUrl= [NSString stringWithFormat:@"tel:%@", tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telUrl]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
