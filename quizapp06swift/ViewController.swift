//
//  ViewController.swift
//  quizapp06swift
//
//  Created by chikatokitamuro on 2016/01/26.
//  Copyright © 2016年 chikatokitamuro. All rights reserved.
//

import UIKit
import AVFoundation//音声ライブラリの呼び出し


class ViewController: UIViewController {

    @IBOutlet weak var mondai: UITextView!
    
    @IBOutlet weak var marubuttun: UIButton!
    @IBOutlet weak var pekebuttun: UIButton!
    
    @IBOutlet weak var kaitou: UILabel!
    
    @IBOutlet weak var seikairitu: UILabel!
    
    var countNumber:Int //問題の順番　最初の問題は０番目　case 0
    
    var seikaisu:Double
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mondai.text = "問題１、マツコとキムタクは高校１年の時、同級生であった";//mondaiに入力
        
        [self.soundTable = "sei", "fusei"];
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func playSound() {
    //音楽ファイル名を作成
    /*NSString *soundFileName = [NSString stringWithFormat:@"koukaonn_%@",scaleName];*/
    let soundFileName = "koukaonn"

    //音楽ファイルのファイルパス(音楽ファイルがデータ上どこにあるか)を作成
    //NSBundle *bundle = [NSBundle mainBundle];
    let bundle = NSBundle.mainBundle()
    var path:String = "mp3"
    //NSString *path = [bundle pathForResource:scaleName
        //ofType:@"mp3"];

    //NSURL *url = [NSURL fileURLWithPath:path];
    let url = NSURL.fileURLWithPath(path)
        
    //エラーを受け取る変数の準備
    //NSError *error = nil;
    var error:String? = nil
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (error != nil) { //エラーがあった場合
    return;
    }
        
    [self.player play];
        
    }

    @IBAction func marubuttunaction(sender: AnyObject) {
        //maruボタンが押された時の処置
        switch  (countNumber) {
        case 0:
            // 最初の問題は丸が正解なので、正解扱いにする
            //[self seikai];//seikai時の処置を呼び出す
            seikai()
            seikaisu++;//seikaisuを一つカウントする
            break;
        case 1:
            //[self seikai];
            seikai()
            seikaisu++;
            break;
        case 2:
            //[self fuseikai];//fuseikai時の処置を呼び出す
            fuseikai()
            break;
        case 3:
            //[self seikai];
            seikai()
            seikaisu++;
            break;
        case 4:
            //[self fuseikai];
            fuseikai()
            break;
        default:
            break;
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
            break;
        case 1:
            fuseikai()
            break;
        case 2:
            seikai()
            seikaisu++;
            break;
        case 3:
            fuseikai()
            break;
        case 4:
            seikai()
            seikaisu++;
            break;
        default:
            break;
        }
        
        countNumber++;
        showQuestion()//shouQuestionの処理を呼び出す
        
    }
    
    func seikai() {
    // 正解だった時の処理
    kaitou.text = "正解です"
    seikairitu.text = "正解率は\(seikaisu/5*100)です"
    //正解時の音声ファイルを鳴らす
    var musicName:String = "shot-struck1";
        //ダウンロードしたファイル
        //[self playSound:musicName];
    playsound(musicName)->String
        
    }

    

    
    func fuseikai() {
    // 不正解だった時の処理
    kaitou.text = "不正解です"
    var string:String = "bomb1";
        //不正解時の音声ファイルを鳴らす
        
        //[self playSound:string];//objective c
        playsound()->String//swift
        
}

    
    // 問題を出題する
    func showQuestion() {
            switch (countNumber) {
            case 0:
                mondai.text = "問題１、マツコとキムタクは高校１年の時、同級生であった"
                break;
            case 1:
                mondai.text = "問題2、一富士二鷹三茄子の次は四扇子、五煙草、六座頭である"
                break;
            case 2:
                mondai.text = "問題3、首無しのニワトリマイクは１８日間生きた"
                break;
            case 3:
                mondai.text = "問題4、クマムシは宇宙空間でも死なない"
                break;
            case 4:
                mondai.text = "問題5、唾液は無菌状態であるため、消毒にも使用できる"
                break;
            default:
                break;
            }
        }

    
}







