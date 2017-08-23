//
//  DWControls.h
//
//  Created by Dicky on 2017/2/9.
//  Copyright © 2017年 Dicky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DWControls : NSObject
#pragma mark --- Fuctions
/**
 *  将button的图片放到右边,文字在左
 *
 *  @param button     需要处理的button
 *  @param gapWidth   文字与图片间隔距离，默认为0
 */
+ (void)setButtonImageToRightWithButton:(UIButton *)button gapWidth:(CGFloat)gapWidth;

/**
 更改textField的placeholder字体颜色
 
 @param textField 需要更改的输入框
 @param color 需要修改的颜色
 */
+ (void)changeTextFieldPlaceholderColor:(UITextField *)textField color:(UIColor *)color;

#pragma mark --- Cell高度自动计算
/**
 *  自动计算cell高度 (不带缓存)
 *
 *  @param cell       需要计算的cell
 *  @param tableView  cell父控件
 *
 *  @return 计算后的cell高度
 */
+ (CGFloat)calculateCellHeightWithCell:(UITableViewCell *)cell
                             tableView:(UITableView *)tableView;

@end


#pragma mark - UILabel拓展
@interface UILabel (DWControls)

/**
 快速创建label

 @param frame 坐标
 @param text 显示文本
 @param textColor 文本颜色
 @param textFont 字体大小
 @param fitWidth 是否自适应
 @param superview 父视图->该参数必须为UIView或者其子类。若该参数不为空，则会将创建好的label添加到父视图上
 @return 创建好的label
 */
+ (id)labelWithFrame:(CGRect)frame
                text:(NSString *)text
           textColor:(UIColor *)textColor
            textFont:(CGFloat)textFont
            fitWidth:(BOOL)fitWidth
           superview:(id)superview;

@end

#pragma mark - UIImageView拓展
@interface UIImageView (DWControls)

/**
 快速创建imageView

 @param frame 坐标
 @param imageFile 图片地址
 @param superview 父视图->该参数必须为UIView或者其子类。若该参数不为空，则会将创建好的imageView添加到父视图上
 @return 创建好的imageView
 */
+ (id)imageViewWithFrame:(CGRect)frame
               imageFile:(NSString *)imageFile
               superview:(id)superview;

@end

#pragma mark - UIView拓展
@interface UIView (DWControls)

/**
 快速创建UIView

 @param frame 坐标
 @param backgroundColor 背景颜色
 @param superview 父视图->该参数必须为UIView或者其子类。若该参数不为空，则会将创建好的UIView添加到父视图上
 @return 创建好的UIView
 */
+ (id)viewWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)backgroundColor
          superview:(id)superview;

@end

#pragma mark - UIButton拓展
@interface UIButton (DWControls)

/**
 快速创建button

 @param frame 坐标
 @param backgroundColor 背景颜色
 @param title 显示文本
 @param titleColor 文本颜色
 @param titleFont 文本字体大小
 @param target 点击事件对象
 @param action 点击事件方法
 @param superview 父视图->该参数必须为UIView或者其子类。若该参数不为空，则会将创建好的button添加到父视图上
 @return 创建好的button
 */
+ (id)buttonWithFrame:(CGRect)frame
      backgroundColor:(UIColor *)backgroundColor
                title:(NSString *)title
           titleColor:(UIColor *)titleColor
            titleFont:(CGFloat)titleFont
               target:(id)target
               action:(SEL)action
            superview:(id)superview;

@end


#pragma mark - UITextField拓展
@interface UITextField (DWControls)

/**
 快速创建textField

 @param frame 坐标
 @param delegate 代理对象
 @param text 显示文本
 @param textColor 文本颜色
 @param textFont 文本字体大小
 @param placeholder 占框提示文本
 @param superview 父视图->该参数必须为UIView或者其子类。若该参数不为空，则会将创建好的textField添加到父视图上
 @return 创建好的textField
 */
+ (id)textFieldWithFrame:(CGRect)frame
                delegate:(id)delegate
                    text:(NSString *)text
               textColor:(UIColor *)textColor
                textFont:(CGFloat)textFont
             placeholder:(NSString *)placeholder
               superview:(id)superview;

@end


#pragma mark - UITableView拓展
@interface UITableView (DWControls)

/**
 快速创建tableView

 @param frame 坐标
 @param backgroundColor 背景颜色
 @param delegate 代理对象
 @param dataSource 数据源对象
 @param tableViewStyle 样式
 @param separatorStyle 分割线样式
 @param superview 父视图->该参数必须为UIView或者其子类。若该参数不为空，则会将创建好的tableView添加到父视图上
 @return 创建好的tableView
 */
+ (id)tableViewWithFrmae:(CGRect)frame
         backgroundColor:(UIColor *)backgroundColor
                delegate:(id)delegate
              dataSource:(id)dataSource
          tableViewStyle:(UITableViewStyle)tableViewStyle
          separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
               superview:(id)superview;
@end


#pragma mark - UIScrollView拓展
@interface UIScrollView (DWControls)

/**
 快速创建scrollView

 @param frame 坐标
 @param delegate 代理对象
 @param backgroundColor 背景颜色
 @param superview 父视图->该参数必须为UIView或者其子类。若该参数不为空，则会将创建好的scrollView添加到父视图上
 @return 创建好的scrollView
 */
+ (id)scrollViewWithFrame:(CGRect)frame
                 delegate:(id)delegate
          backgroundColor:(UIColor *)backgroundColor
                superview:(id)superview;


@end

