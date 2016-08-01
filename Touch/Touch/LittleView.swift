//
//  LittleView.swift
//  Touch
//
//  Created by Mark Meretzky on 7/15/16.
//  Copyright © 2016 Mark Meretzky. All rights reserved.
//

import UIKit;

class LittleView: UIView {

	//Called by the init method of class View.
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		// Initialization code
		backgroundColor = UIColor.yellowColor();
	}
	
	//Never called, but required anyway.
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!;
	}

	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.

	override func drawRect(rect: CGRect) {
		// Drawing code
		let font: UIFont = UIFont.systemFontOfSize(bounds.size.height / 2);
		let attributes: [String: AnyObject] = [NSFontAttributeName: font]; //a dictionary
		"Hello!".drawAtPoint(CGPointZero, withAttributes: attributes);
	}

}
