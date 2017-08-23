//
//  DWControls.m
//
//  Created by Dicky on 2017/2/9.
//  Copyright © 2017年 Dicky. All rights reserved.
//

#import "DWControls.h"

@implementation DWControls
#pragma mark --- Fuctions
//将button的图片放到右边,文字在左
+ (void)setButtonImageToRightWithButton:(UIButton *)button gapWidth:(CGFloat)gapWidth {
    if (button.titleLabel.text.length<=0 || !button.imageView.image) {
        return;
    }
    CGFloat imageWidth = button.imageView.frame.size.width;
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth - gapWidth/2, 0, imageWidth)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width + gapWidth/2, 0, -button.titleLabel.bounds.size.width)];
}

//更改textField的placeholder字体颜色
+ (void)changeTextFieldPlaceholderColor:(UITextField *)textField color:(UIColor *)color {
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
}

#pragma mark --- Cell高度自动计算
//自动计算cell高度
+ (CGFloat)calculateCellHeightWithCell:(UITableViewCell *)cell tableView:(UITableView *)tableView {
    
    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    /*------------------------------重点这里必须加上contentView的宽度约束不然计算出来的高度不准确-------------------------------------*/
    CGFloat contentViewWidth = CGRectGetWidth(tableView.bounds);
    NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:contentViewWidth];
    [cell.contentView addConstraint:widthFenceConstraint];
    // Auto layout engine does its math
    CGFloat fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    [cell.contentView removeConstraint:widthFenceConstraint];
    /*-------------------------------End------------------------------------*/
    
    CGFloat cellHeight = fittingHeight+2*1/[UIScreen mainScreen].scale;//必须加上上下分割线的高度
    
    return cellHeight;
}

@end


#pragma mark - UILabel拓展
@implementation UILabel (DWControls)
//快速创建label
+ (id)labelWithFrame:(CGRect)frame
                text:(NSString *)text
           textColor:(UIColor *)textColor
            textFont:(CGFloat)textFont
            fitWidth:(BOOL)fitWidth
           superview:(id)superview {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (text && text.length > 0) {
        label.text = text;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (textFont > 0) {
        label.font = [UIFont systemFontOfSize:textFont];
    }
    if (fitWidth) {
        label.adjustsFontSizeToFitWidth = YES;
    } else {
        label.adjustsFontSizeToFitWidth = NO;
    }
    label.textAlignment = NSTextAlignmentLeft;
    if (superview) {
        [superview addSubview:label];
    }
    return label;
}

@end


#pragma mark - UIImageView拓展
@implementation UIImageView (DWControls)
//快速创建imageView
+ (id)imageViewWithFrame:(CGRect)frame
               imageFile:(NSString *)imageFile
               superview:(id)superview {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageFile.length > 0) {
        imageView.image = [UIImage imageNamed:imageFile];
    }
    if (superview) {
        [superview addSubview:imageView];
    }
    return imageView;
}

@end


#pragma mark - UIView拓展
@implementation UIView (DWControls)
//快速创建UIView
+ (id)viewWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)backgroundColor
          superview:(id)superview {
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    if (superview) {
        [superview addSubview:view];
    }
    return view;
}

@end


#pragma mark - UIButton拓展
@implementation UIButton (DWControls)
//快速创建button
+ (id)buttonWithFrame:(CGRect)frame
     backgroundColor:(UIColor *)backgroundColor
               title:(NSString *)title
          titleColor:(UIColor *)titleColor
           titleFont:(CGFloat)titleFont
              target:(id)target
              action:(SEL)action
           superview:(id)superview {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (backgroundColor) {
        [button setBackgroundColor:backgroundColor];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (titleFont > 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (superview) {
        [superview addSubview:button];
    }
    return button;
}

@end

#pragma mark - UITextField拓展
@implementation UITextField (DWControls)
//快速创建textField
+ (id)textFieldWithFrame:(CGRect)frame
                delegate:(id)delegate
                    text:(NSString *)text
               textColor:(UIColor *)textColor
                textFont:(CGFloat)textFont
             placeholder:(NSString *)placeholder
               superview:(id)superview {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleNone;
    if (delegate) {
        textField.delegate = delegate;
    }
    if (text && text.length > 0) {
        textField.text = text;
    }
    if (placeholder && placeholder.length > 0) {
        textField.placeholder = placeholder;
    }
    if (textFont > 0) {
        textField.font = [UIFont systemFontOfSize:textFont];
    }
    textField.returnKeyType = UIReturnKeyDone;
    textField.borderStyle = UITextBorderStyleNone;                      //取消边框
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;        //编辑时展示清除按钮
    textField.autocorrectionType = UITextAutocorrectionTypeNo;          //取消自动修正
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;//取消自动大写
    if (superview) {
        [superview addSubview:textField];
    }
    return textField;
}

@end


#pragma mark - UITableView拓展
@implementation UITableView (DWControls)
//快速创建tableView
+ (id)tableViewWithFrmae:(CGRect)frame
         backgroundColor:(UIColor *)backgroundColor
                delegate:(id)delegate
              dataSource:(id)dataSource
          tableViewStyle:(UITableViewStyle)tableViewStyle
          separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
               superview:(id)superview {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:tableViewStyle];
    if (backgroundColor) {
        tableView.backgroundColor = backgroundColor;
    }
    if (delegate) {
        tableView.delegate = delegate;
    }
    if (dataSource) {
        tableView.dataSource = dataSource;
    }
    if (separatorStyle) {
        tableView.separatorStyle = separatorStyle; //分割线样式
    }else {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    if (superview) {
        [superview addSubview:tableView];
    }
    return tableView;
}

@end


#pragma mark - UIScrollView拓展
@implementation UIScrollView (DWControls)
//快速创建scrollView
+ (id)scrollViewWithFrame:(CGRect)frame
                 delegate:(id)delegate
          backgroundColor:(UIColor *)backgroundColor
                superview:(id)superview {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    if (backgroundColor) {
        scrollView.backgroundColor = backgroundColor;
    }
    if (delegate) {
        scrollView.delegate = delegate;
    }
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    if (superview) {
        [superview addSubview:scrollView];
    }
    return scrollView;
}

@end
