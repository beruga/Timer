//
//  ViewController.swift
//  timer
//
//  Created by タケダ　アスカ on 2017/07/14.
//  Copyright © 2017年 タケダ　アスカ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 表示用ラベル
    @IBOutlet weak var timerLabel: UILabel!
    
    // タイマー用の時間の変数
    var timer : Timer!
    var timer_sec :Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // selector: #selector(updatetimer) で指定された関数
    // timeOnterval: 0.1, repeats: true で指定された通り、0.1秒ごとに呼び出され続ける
    func updateTimer(timer: Timer) {
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
    }
    
    // 再生ボタン
    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval:0.1, target:self,selector: #selector(updateTimer),userInfo: nil, repeats: true)
        }
    }
    
    // 一時停止ボタン
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    // リセットボタン
    @IBAction func resetTimer(_ sender: Any) {
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", timer_sec)
        self.timer = nil
    }
}
