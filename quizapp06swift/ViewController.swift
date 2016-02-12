//
//  ViewController.swift
//  quizapp06swift
//
//  Created by chikatokitamuro on 2016/01/26.
//  Copyright © 2016年 chikatokitamuro. All rights reserved.
//

import UIKit
import AVFoundation//音声ライブラリの呼び出し


class ViewController:UIViewController,AVAudioPlayerDelegate{

    @IBOutlet weak var mondai: UITextView!
    
    @IBOutlet weak var marubuttun: UIButton!
    @IBOutlet weak var pekebuttun: UIButton!
    
    @IBOutlet weak var kaitou: UILabel!
    
    @IBOutlet weak var seikairitu: UILabel!
    
    var countNumber = 0//問題の順番　最初の問題は０番目　case 0
    
    var seikaisu:Float = 0
    
    //var soundTable:String
    
    var player:AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mondai.text = "問題１、マツコとキムタクは高校１年の時、同級生であった";//mondaiに入力
        
       // [self.soundTable = "sei", "fusei"];
      //var soundTableArray = [ "s", "f"]//soundTable配列を作成
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
    func playSound(scaleName: String) {
        let soundFileName = "\(scaleName)"
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource(soundFileName, ofType: "mp3")
        let url = NSURL(fileURLWithPath:path!)
        player = try!AVAudioPlayer(contentsOfURL: url)
        player.delegate = self
        player.play()
    }
    
    
    
    
    @IBAction func marubuttunaction(sender: AnyObject) {
        //maruボタンが押された時の処置
        switch  (countNumber) {
        case 0:
            // 最初の問題は丸が正解なので、正解扱いにする
            seikaisu++;//seikaisuを一つカウントする
            //[self seikai];//seikai時の処置を呼び出す
            seikai()
        case 1:
            seikaisu++;
            //[self seikai];
            seikai()
            
        case 2:
            //[self fuseikai];//fuseikai時の処置を呼び出す
            fuseikai()
            
        case 3:
            seikaisu++;
            //[self seikai];
            seikai()
            
        case 4:
            //[self fuseikai];
            fuseikai()
            
        default:
            return
    }
        // 正解でも不正解でも、次の問いに進む
        countNumber++;
        //[self showQuestion];//
        showQuestion()

        
    }
    
    @IBAction func pekebuttunaction(sender: AnyObject) {
        switch (countNumber) {
        case 0:
            //[self fuseikai];
            fuseikai()//不正解時の処理を呼び出す
            
        case 1:
            fuseikai()
            
        case 2:
            seikaisu++;
            seikai()
            
        case 3:
            fuseikai()
            
        case 4:
            seikaisu++;
            seikai()
            
        default:
            return
        }
        
        countNumber++;
        showQuestion()//shouQuestionの処理を呼び出す
        
    }
    
    func seikai() {
    // 正解だった時の処理
    kaitou.text = "正解です"
    seikairitu.text = "正解率は\(seikaisu/5*100)%です"
    //正解時の音声ファイルを鳴らす
    let musicName:String = "shot-struck1";
        //ダウンロードしたファイル
        //[self playSound:musicName];
        self.playSound(musicName);
        
    }

    

    
    func fuseikai() {
    // 不正解だった時の処理
    kaitou.text = "不正解です"
    let string:String = "bomb1";
        //不正解時の音声ファイルを鳴らす
        //[self playSound:string];//objective c
       self.playSound(string);
        
}

    
    // 問題を出題する
    func showQuestion() {
            switch (countNumber) {
            case 0:
                mondai.text = "問題１、マツコとキムタクは高校１年の時、同級生であった"
                
            case 1:
                mondai.text = "問題2、一富士二鷹三茄子の次は四扇子、五煙草、六座頭である"
                
            case 2:
                mondai.text = "問題3、首無しのニワトリマイクは１８日間生きた"
                
            case 3:
                mondai.text = "問題4、クマムシは宇宙空間でも死なない"
                
            case 4:
                mondai.text = "問題5、唾液は無菌状態であるため、消毒にも使用できる"
            
            default:
             return
            }
        }

    
}







