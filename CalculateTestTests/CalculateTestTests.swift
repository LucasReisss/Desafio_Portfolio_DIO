//
//  CalculateTestTests.swift
//  CalculateTestTests
//
//  Created by Lucas da Silva Reis on 21/10/23.
//

import XCTest
@testable import CalculateTest

final class CalculateTestTests: XCTestCase {
    
    var application: Calulator!

    override func setUpWithError() throws {
        application = Calulator()
    }

    override func tearDownWithError() throws {
        application = nil
    }
    
    let a: Int = 5
    let b: Int = 5
    
    func testAdd(){
        let result = application.add( a, b)
        
        XCTAssertEqual(result, 10, "Ops algo errado")
    }
    
    func testSutract(){
        let result = application.sutract( a, b)
        
        XCTAssertEqual(result, 0, "Ops algo errado")
    }
    
    func testMultiply(){
        let result = application.multiply( a, b)
        
        XCTAssertEqual(result, 25, "Ops algo errado")
    }
    
    func testDivide(){
        let result = application.divide( a, b)
        
        XCTAssertEqual(result, 1, "Ops algo errado")
    }
    
    

}
