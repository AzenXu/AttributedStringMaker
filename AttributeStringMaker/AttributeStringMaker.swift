//
//  AttributeStringMaker.swift
//
//  Created by XuAzen on 16/6/27.
//  Copyright © 2016年 st. All rights reserved.
//

import UIKit

public extension String {
    public var attriString: NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
}

extension NSString {
    var attriString: NSMutableAttributedString {
        return NSMutableAttributedString.init(string: String(self))
    }
}

public extension NSMutableAttributedString {
    public func append(string: NSAttributedString) -> NSMutableAttributedString {
        self.append(string)
        return self
    }
    public func setAtt(_ attrMaker: (_ maker: AttributeMaker)->()) -> NSMutableAttributedString {
        let maker = AttributeMaker()
        attrMaker(maker)
        self.setAttributes(maker.dictionary, range: NSRange.init(location: 0, length: self.length))
        if maker.attachment != nil {
            let attriForAttach = NSAttributedString(attachment: maker.attachment!)
            self.append(attriForAttach)
        }
        return self
    }
    public class AttributeMaker {

        var dictionary: [String : Any] = [:]
        let defaultParagraphStyle = NSMutableParagraphStyle()

        /**设置字体属性，默认值：字体：Helvetica(Neue) 字号：12*/
        open var font: UIFont? {
            didSet {
                if let font = self.font {
                    self.dictionary.updateValue(font, forKey: NSFontAttributeName)
                }
            }
        }
        /**设置字体颜色，取值为 UIColor对象，默认值为黑色*/
        open var color: UIColor? {
            didSet {
                if let color = self.color {
                    self.dictionary.updateValue(color, forKey: NSForegroundColorAttributeName)
                }
            }
        }
        /**设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色*/
        open var backgroundColor: UIColor? {
            didSet {
                if let backgroundColor = self.backgroundColor {
                    self.dictionary.updateValue(backgroundColor, forKey: NSBackgroundColorAttributeName)
                }
            }
        }
        /**设定字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄*/
        open var kern: NSNumber? {
            didSet {
                if let kern = self.kern {
                    self.dictionary.updateValue(kern, forKey: NSKernAttributeName)
                }
            }
        }
        /**设置删除线*/
        open var deleteLineNum: Int? {
            didSet {
                if let num = self.deleteLineNum {
                    self.dictionary.updateValue(num as AnyObject, forKey: NSStrikethroughStyleAttributeName)
                }
            }
        }
        /**设置删除线颜色，取值为 UIColor 对象，默认值为黑色*/
        open var deleteLineColor: UIColor? {
            didSet {
                if let color = self.deleteLineColor {
                    self.dictionary.updateValue(color, forKey: NSStrikethroughColorAttributeName)
                }
            }
        }
        /**是否使用默认的连体字符*/
        open var ligature: Bool? {
            didSet {
                if let ligature = self.ligature {
                    self.dictionary.updateValue(ligature ? 1 : 0, forKey: NSLigatureAttributeName)
                }
            }
        }
        /**设置下划线*/
        open var underLine: NSUnderlineStyle? {
            didSet {
                if let underLine = self.underLine {
                    self.dictionary.updateValue(underLine.rawValue, forKey: NSUnderlineStyleAttributeName)
                }
            }
        }
        /**设置下划线颜色，取值为 UIColor 对象，默认值为黑色*/
        open var underLineColor: UIColor? {
            didSet {
                if let underLineColor = self.underLineColor {
                    self.dictionary.updateValue(underLineColor, forKey: NSUnderlineColorAttributeName)
                }
            }
        }
        /**设置笔画宽度，取值为 NSNumber 对象（整数），负值填充效果，正值中空效果*/
        open var strokeWidth: NSNumber? {
            didSet {
                if let strokeWidth = self.strokeWidth {
                    self.dictionary.updateValue(strokeWidth, forKey: NSStrokeWidthAttributeName)
                }
            }
        }
        /**填充部分颜色，不是字体颜色*/
        open var strokeColor: UIColor? {
            didSet {
                if let strokeColor = self.strokeColor {
                    self.dictionary.updateValue(strokeColor, forKey: NSStrokeColorAttributeName)
                }
            }
        }
        /**设置阴影属性*/
        open var shadow: NSShadow? {
            didSet {
                if let shadow = self.shadow {
                    self.dictionary.updateValue(shadow, forKey: NSShadowAttributeName)
                }
            }
        }
        /**设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用*/
        open var textEffect: NSString? {
            didSet {
                if let textEffect = self.textEffect {
                    self.dictionary.updateValue(textEffect, forKey: NSTextEffectAttributeName)
                }
            }
        }
        /**设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏*/
        open var baseLineOffset: NSNumber? {
            didSet {
                if let baseLineOffset = self.baseLineOffset {
                    self.dictionary.updateValue(baseLineOffset, forKey: NSBaselineOffsetAttributeName)
                }
            }
        }
        /**设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾*/
        open var obliqueness: NSNumber? {
            didSet {
                if let obliqueness = self.obliqueness {
                    self.dictionary.updateValue(obliqueness, forKey: NSObliquenessAttributeName)
                }
            }
        }
        /**设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本*/
        open var expansion: NSNumber? {
            didSet {
                if let expansion = self.expansion {
                    self.dictionary.updateValue(expansion, forKey: NSExpansionAttributeName)
                }
            }
        }
        /**设置文字书写方向，从左向右书写或者从右向左书写*/
        open var writingDirectionFromLeft: Bool? {
            didSet {
                if let writingDirectionFromLeft = self.writingDirectionFromLeft {
                    self.dictionary.updateValue(writingDirectionFromLeft ? 1 : 0, forKey: NSWritingDirectionAttributeName)
                }
            }
        }
        /**设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本*/
        open var verticalGlyphForm: Bool? {
            didSet {
                if let verticalGlyphForm = self.verticalGlyphForm {
                    self.dictionary.updateValue(verticalGlyphForm ? 1 : 0, forKey: NSVerticalGlyphFormAttributeName)
                }
            }
        }
        /**设置链接属性，点击后调用浏览器打开指定URL地址*/
        open var link: URL? {
            didSet {
                if let link = self.link {
                    self.dictionary.updateValue(link as AnyObject, forKey: NSLinkAttributeName)
                }
            }
        }
        /**设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排*/
        open var attachment: NSTextAttachment?
        /**设置文本段落排版格式*/
        open var paragraphStyle: NSParagraphStyle? {
            didSet {
                if let paragraphStyle = self.paragraphStyle {
                    self.dictionary.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName)
                }
            }
        }
        /**行距 PS.需要numberOfLines = 0才有效 */
        open var lineSpacing: CGFloat? {
            didSet {
                if let lineSpacing = self.lineSpacing {
                    defaultParagraphStyle.lineSpacing = lineSpacing
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**段间距 PS.需要numberOfLines = 0才有效 */
        open var paragraphSpacing: CGFloat? {
            didSet {
                if let paragraphSpacing = self.paragraphSpacing {
                    defaultParagraphStyle.paragraphSpacing = paragraphSpacing
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**对齐方式 PS.需要numberOfLines = 0才有效 */
        open var alignment: NSTextAlignment? {
            didSet {
                if let alignment = self.alignment {
                    defaultParagraphStyle.alignment = alignment
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**首行缩进 PS.需要numberOfLines = 0才有效 */
        open var firstLineHeadIndent: CGFloat? {
            didSet {
                if let firstLineHeadIndent = self.firstLineHeadIndent {
                    defaultParagraphStyle.firstLineHeadIndent = firstLineHeadIndent
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**除首行之外其他行缩进 PS.需要numberOfLines = 0才有效 */
        open var headIndent: CGFloat? {
            didSet {
                if let headIndent = self.headIndent {
                    defaultParagraphStyle.headIndent = headIndent
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**每行容纳字符的宽度 PS.需要numberOfLines = 0才有效 */
        open var tailIndent: CGFloat? {
            didSet {
                if let tailIndent = self.tailIndent {
                    defaultParagraphStyle.tailIndent = tailIndent
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**换行方式 PS.需要numberOfLines = 0才有效 */
        open var lineBreakMode: NSLineBreakMode? {
            didSet {
                if let lineBreakMode = self.lineBreakMode {
                    defaultParagraphStyle.lineBreakMode = lineBreakMode
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**最小行高 PS.需要numberOfLines = 0才有效 */
        open var minimumLineHeight: CGFloat? {
            didSet {
                if let minimumLineHeight = self.minimumLineHeight {
                    defaultParagraphStyle.minimumLineHeight = minimumLineHeight
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**最大行高 PS.需要numberOfLines = 0才有效 */
        open var maximumLineHeight: CGFloat? {
            didSet {
                if let maximumLineHeight = self.maximumLineHeight {
                    defaultParagraphStyle.maximumLineHeight = maximumLineHeight
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /**书写方式 PS.需要numberOfLines = 0才有效 */
        open var baseWritingDirection: NSWritingDirection? {
            didSet {
                if let baseWritingDirection = self.baseWritingDirection {
                    defaultParagraphStyle.baseWritingDirection = baseWritingDirection
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /** PS.需要numberOfLines = 0才有效 */
        open var lineHeightMultiple: CGFloat? {
            didSet {
                if let lineHeightMultiple = self.lineHeightMultiple {
                    defaultParagraphStyle.lineHeightMultiple = lineHeightMultiple
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /** PS.需要numberOfLines = 0才有效 */
        open var paragraphSpacingBefore: CGFloat? {
            didSet {
                if let paragraphSpacingBefore = self.paragraphSpacingBefore {
                    defaultParagraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /** PS.需要numberOfLines = 0才有效 */
        open var hyphenationFactor: Float? {
            didSet {
                if let hyphenationFactor = self.hyphenationFactor {
                    defaultParagraphStyle.hyphenationFactor = hyphenationFactor
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /** PS.需要numberOfLines = 0才有效 */
        open var tabStops: [NSTextTab]? {
            didSet {
                if let tabStops = self.tabStops {
                    defaultParagraphStyle.tabStops = tabStops
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
        /** PS.需要numberOfLines = 0才有效 */
        open var defaultTabInterval: CGFloat? {
            didSet {
                if let defaultTabInterval = self.defaultTabInterval {
                    defaultParagraphStyle.defaultTabInterval = defaultTabInterval
                    paragraphStyle = defaultParagraphStyle
                }
            }
        }
    }
}
