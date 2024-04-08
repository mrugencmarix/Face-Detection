//
// BarabaDelegate.swift
//
// Copyright (c) 2020 Soojin Ro (https://github.com/nsoojin)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

/**
 Methods you can implement to be notified of Baraba events and life cycle changes.
 */
public protocol BarabaDelegate: AnyObject {
    /**
     - Parameters:
        - baraba: The baraba object that initiated the scrolling.
     */
    func barabaDidStartVideo(_ baraba: Baraba)
    
    /**
     - Parameters:
        - baraba: The baraba object that stopped the scrolling.
    */
    func barabaDidStopVideo(_ baraba: Baraba)
    
    /**
     - Parameters:
        - baraba: The baraba object that failed.
        - error: An error object describing the failure.
    */
    func baraba(_ baraba: Baraba, didFailWithError error: Error)
}

public extension BarabaDelegate {
    func barabaDidStartVideo(_ baraba: Baraba) {}
    func barabaDidStopVideo(_ baraba: Baraba) {}
    func baraba(_ baraba: Baraba, didFailWithError error: Error) {}
}
