//
//  Datacontent.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/06/23.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//
import Foundation
import UIKit

class Datacontent: NSObject {
    var questionArray : [String]
    var questionDescription : [String]
    var photo1NameArray : [String]
    var photo2NameArray : [String]
    
    override init() {
        self.questionArray = ["【メンズ】どちらの男性がかっこいい？？","【ゲット】仲間にするなら？？", "【ことわざ】木から落ちるのは？？", "【駄菓子】アマゾンで頼むなら？？", "【今日のオススメ】スカッとする映画は？？", "【美女判定】美人なのはどっち？？", "【海外俳優】付き合うなら", "【学習言語】勉強するならどっち？？", "【ケーキ対決】作るならどっち？？"]
        self.photo1NameArray = ["left.jpg","2_1.jpg", "3_1.jpg", "4_1.jpg", "5_1.jpg", "6_1.jpg", "7_1.jpg", "8_1.jpg", "9_1.jpg"]
        self.photo2NameArray = ["right.jpg","2_2.jpg", "3_2.jpg", "4_2.jpg", "5_2.jpg", "6_2.jpg", "7_2.jpg", "8_2.jpg", "9_2.jpg"]
        self.questionDescription = ["今私は、二人の男性からアプローチされています。どちらの男性も優しく、魅力的なのですが正直海外の男性の外見のかっこよさが評価できません。皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？皆さんはどちらの男性がかっこいいと思いますか？","仲間にするならどっちがいいいですか？将来のパートナーを探してます。", "ことわざクイズです！", "どちらの大好きなお菓子で、今度100箱アマゾンで注文する予定なのですがどちらを買ったらいいと思いますか？", "今週の日曜日、久しぶりに休暇でスカッとする映画を見たいのですがどちらがオススメですか？とりあえず、ストレス溜まってます。", "現実にいるとしたらどっちが美人だと思う？", "どちらの俳優さんも大好きで付き合えることなら付き合いたいのですが、世間の皆さんはどちらの方と付き合いたいと思いますか？", "これから、プログラミングを勉強しようと思っているのですがどちらの言語を学ぶべきですか？皆さんの意見聞きたいです。", "今度のパーティでケーキを作ろうと考えてるのですが皆さんならどちらのケーキを作りますか？ちなみに、パーティは女子会です。"]
    }
    
    func getItemsCount() -> Int {
      return self.questionArray.count
    }
    
    func getImageName(index: Int, imageSide: Int) -> String {
        var imageName: String?
        if imageSide == 0 {
           imageName = self.photo1NameArray[index]
        }
        else if imageSide == 1 {
           imageName = self.photo2NameArray[index]
        }
        return imageName!
    }
    
    func getTitle(index: Int) -> String {
        return self.questionArray[index]
    }
    
    func getQuestionDescription(index: Int) -> String {
        return self.questionDescription[index]
    }
}
