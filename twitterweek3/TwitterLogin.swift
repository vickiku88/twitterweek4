//
//  TwitterLogin.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/10/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

protocol TwitterLoginDelegate: class {
    func continueLogin()
    func doNotContinueLogin()

}
