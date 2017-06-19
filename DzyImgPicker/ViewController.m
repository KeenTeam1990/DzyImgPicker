//
//  ViewController.m
//  DzyImgPicker
//
//  Created by XG on 16/8/3.
//  Copyright © 2016年 com.Xg_FB. All rights reserved.
//

#import "ViewController.h"
#import "DzyImgPicker.h"

#define DzyWid ([UIScreen mainScreen].bounds.size.width)
#define DzyHei ([UIScreen mainScreen].bounds.size.height)

@interface ViewController () <DzyImgDelegate>
{
    DzyImgPicker *DzyView;
    NSMutableArray *_imageDataArray;
}

@property (nonatomic ) NSArray *data;

@end

@implementation ViewController



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [DzyView.collectionView reloadData];
    
}
#pragma - DzyImgDelegate
- (void)getImages:(NSArray *)imgData{
    
   
    
     _imageDataArray = [NSMutableArray array];//存储二进制
    /*
     if (imageArray.count>0) {
     for (int i=0; i<imageArray.count; i++) {
     UIImage *image = imageArray[i];
     imageData = UIImagePNGRepresentation(image);
     NSString * newImageName = [NSString stringWithFormat:@"%@%zi%@", @"Send_image_Name", i, @".jpg"];
     NSString  *jpgPath = NSHomeDirectory();
     jpgPath = [jpgPath stringByAppendingPathComponent:@"Documents"];
     jpgPath = [jpgPath stringByAppendingPathComponent:newImageName];
     [_imageDataArray writeToFile:jpgPath atomically:YES];
     NSLog(@"%@",jpgPath);
     [_imageDataArray addObject:imageData];
     }
     
    
     - (NSURLSessionDataTask *)POST:(NSString *)URLString
     parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
     progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
     
     //多张图片上传  简历一个  网络请求类  然后我这里写的是 直接用
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
     
     [manager POST:@"" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
     // 上传 多张图片
     for(NSInteger i = 0; i < _imageDataArray.count; i++)
     {
     NSData * imageData = [_imageDataArray objectAtIndex: i];
     // 上传的参数名
     NSString * Name = [NSString stringWithFormat:@"%@%zi", @"Send_image_Name", i+1];
     // 上传filename
     NSString * fileName = [NSString stringWithFormat:@"%@.jpg", Name];
     NSLog(@"%@",fileName);
     
     //  ********** 此处需要注意的是需要传输的数据名称是要和后台的名称一样  Name   fileName
     
     [formData appendPartWithFileData:imageData name:Name fileName:fileName mimeType:@"image/jpeg"];
     
     }
     } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     
     }];
     
     */
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.data = [NSArray new];
    
    DzyView = [[DzyImgPicker alloc] initWithFrame:CGRectMake(0, 360, DzyWid, 80) andParentV:self andMaxNum:3];
    DzyView.dzyImgDelegate = self;
    DzyView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:DzyView];
    
    __weak typeof(self)weakSelf = self;
    [DzyView setDzyImgs:^(NSArray *data) {
        weakSelf.data = data;
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
