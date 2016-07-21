//
//  BasePostQuestionTableViewCell.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/07/03.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class BasePostQuestionTableViewCell: UITableViewCell, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var questionDetailsTextView: UITextView!
    @IBOutlet weak var textViewPlaceholderLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleTextField.delegate = self
        questionDetailsTextView.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //タップイベントを検知する
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        resignFirstResponderAtControls()
    }
    
    private func resignFirstResponderAtControls() {
        //表示しているキーボードを隠す
        titleTextField?.resignFirstResponder()
        questionDetailsTextView?.resignFirstResponder()
    }
    
    //textviewに入力がされ始めたら、Labelを非表示
    func textViewDidChange(textView: UITextView)
    {
        textViewPlaceholderLable.hidden = true
    }

    //textviewからフォーカスが外れて、TextViewが空だったらLabelを再び表示
    func textViewDidEndEditing(textView: UITextView) {
        
        if(textView.text.isEmpty){
            textViewPlaceholderLable.hidden = false
        }
    }
}
