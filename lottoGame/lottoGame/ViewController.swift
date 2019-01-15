//
//  ViewController.swift
//  lottoGame
//
//  Created by Eliana Boado on 1/14/19.
//  Copyright © 2019 Eliana Boado. All rights reserved.
//
// --->This project help you to pick a random lucky number to play the lotto.<---
//

import UIKit

class ViewController: UIViewController {
    
    var luckyNumber : LuckyNumber;      //instance variable of LuckyNumber

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for tag in 1 ... 6 {        //to rounder corner of the buttons
            let button = buttonStackView.viewWithTag(tag) as! UIButton;
            button.layer.cornerRadius = 12;
            button.layer.masksToBounds = true;
        }
        maxValueSegment.selectedSegmentIndex = 0;
        setAllButtons();
    }
    
    required init?(coder aDecoder: NSCoder) {       //initializer from a decoder
        luckyNumber = LuckyNumber(maxVal: 49)       //set the number
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var buttonStackView: UIStackView! //allow the controller to actually talk to the elements in the view
    @IBOutlet weak var maxValueSegment: UISegmentedControl! //allow the controller to actually talk to the elements in the view
    
    func setAllButtons() {
        for i in 0 ..< 6 {
            let num: Int = luckyNumber.number(index: i);
            let tag: Int = i + 1;
            let button = buttonStackView.viewWithTag(tag) as! UIButton;
            button.setTitle("\(num)", for: .normal)
        }
    }
    
    @IBAction func maxValue(_ sender: UISegmentedControl) {    //allow the view elements to notify the controller
        let index = sender.selectedSegmentIndex;
        NSLog("maxValue : index = \(index)")    //for buging
        luckyNumber.maxVal = (index == 0) ? 49 : 86
        pickAll(self);
    }
    
    @IBAction func pickNumber(_ sender: UIButton) {            //allow the view elements to notify the controller
        let tag = sender.tag;
        NSLog("pickNumber : tag = \(tag)");     //for buging
        let index = tag - 1;
        let num = luckyNumber.pick(index: index)
        sender.setTitle("\(num)", for: .normal)
    }
    
    @IBAction func pickAll(_ sender: Any) {
        NSLog("pickAll");
        luckyNumber.pickAll();
        setAllButtons();
    }
}

