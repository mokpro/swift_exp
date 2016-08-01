//
//  View.swift
//  Touch
//
//  Created by Mark Meretzky on 7/15/16.
//  Copyright © 2016 Mark Meretzky. All rights reserved.
//

import UIKit;

class View: UIView {

    var littleViews: [LittleView];
	
    required init(coder aDecoder: NSCoder) {
		let f: CGRect = CGRect(x: 0, y: 0, width: 80, height: 40);
			//call init method of class LittleView
        littleViews = [];

        littleViews.append(LittleView(frame: f));
        
        super.init(coder: aDecoder)!;

        for littleView: LittleView in littleViews {
            addSubview(littleView);
        }
        
		backgroundColor = UIColor.whiteColor();
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		assert(touches.count > 0); //make sure we can apply ! to touches.first
		let touch: UITouch = touches.first!;
		let point: CGPoint = touch.locationInView(self);
        var newPoint: CGPoint;
        
        addNewLittleView(point);
      
        print("\(littleViews.count)");
        for (index, littleView) in littleViews.enumerate() {
            newPoint = CGPoint(x: point.x - 40, y: (point.y + CGFloat(20*index) - 20));
            movePoint(newPoint, littleView: littleView, delay: 0.1*Double(index));	//Move the littleView to a new location.
        }
	}
    
    func movePoint(point: CGPoint, littleView: LittleView, delay: Double) {
        UIView.animateWithDuration(1.0,
                                   delay: delay,
                                   options:  UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {
                                    //This block describes what the animation should do.
                                    littleView.center = point;	//Move the LittleView to a new location.
            },
                                   completion: nil
        );
    }
    
    func addNewLittleView(point: CGPoint){
        let f: CGRect = CGRect(x: point.x, y: point.y, width: 80, height: 40);
        let littleView = LittleView(frame: f)
        littleViews.append(littleView);
        addSubview(littleView);

    }

	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect) {
		// Drawing code
	}
	*/

}
