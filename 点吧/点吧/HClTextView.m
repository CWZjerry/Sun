//
//  proposalController.m
//  点吧
//
//  Created by Jenny on 2017/1/2.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "HClTextView.h"

@interface HClTextView() <UITextViewDelegate>
@property (nonatomic,assign) NSUInteger maxTextCount;

@property (weak, nonatomic) IBOutlet PlaceholderTextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *textCountLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomDivLine;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *divLineHeight;

@end

@implementation HClTextView

- (void)awakeFromNib {
//    _divLineHeight.constant = 0.5;
    _divLineHeight.constant = 1;
    self.textView.delegate = self;
}

- (void)setLeftTitleText:(NSString *)text
{
    _leftLabel.text = text;
}

- (void)setTextCountLabelHidden:(BOOL)hidden
{
    _textCountLabel.hidden = hidden;
}

- (void)setBottomDivLineHidden:(BOOL)hidden
{
    _bottomDivLine.hidden = hidden;
}

- (void)setPlaceholder:(NSString *)placeText
           contentText:(NSString *)contentText
          maxTextCount:(NSUInteger)maxTextCount
{
    _textView.text = contentText;
    _maxTextCount = maxTextCount;
    
    if (placeText.length > 0) {
        self.textView.placeholder = placeText;
    }
    else {
        self.textView.placeholder = @"请输入反馈，我们将为您不断改进";
    }
    [self textViewDidChange:_textView];
}

- (void)textViewDidChange:(UITextView *)textView
{
    [self textViewTextLengthChange:textView.text.length];
    
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        _textCountLabel.text = [NSString stringWithFormat:@"%ld/%ld",textView.text.length,_maxTextCount];
    }
    
    if (_textView.text.length > _maxTextCount) {
        _textCountLabel.textColor = [UIColor redColor];
    }
    else {
        _textCountLabel.textColor = [UIColor darkGrayColor];
    }
    
    if ([_delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [_delegate textViewDidChange:textView];
    }
}

- (void)setClearButtonType:(ClearButtonType)clearButtonType
{
    _clearButtonType = clearButtonType;
}

- (void)textViewTextLengthChange:(NSInteger)length
{
    if ((length == 0 && _clearButtonType == ClearButtonAppearWhenEditing) ||
        _clearButtonType == ClearButtonNeverAppear) {
        _clearButton.hidden = YES;
    }
    else if ((length > 0 && _clearButtonType == ClearButtonAppearWhenEditing) || _clearButtonType == ClearButtonAppearAlways){
        _clearButton.hidden = NO;
    }
    else {
        _clearButton.hidden = YES;
    }
}

- (IBAction)clearButtonClick:(UIButton *)sender
{
    _textView.text = nil;
}

@end
