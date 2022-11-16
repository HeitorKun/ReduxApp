//
//  WarrenChallengeReduxUnitTests.swift
//  WarrenChallengeReduxUnitTests
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//

import XCTest

final class WarrenChallengeReduxUnitTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
    }

    // tests if the first wrong login will produce the correct state
    func testFirstWrongLogin() throws {
        //given
        let loginState = LoginState(loginStateCase: .notLoggedIn)
        let loginAction = LoginFail()
        //when
        let newLoginState = LoginReducer(loginState, loginAction)
        
        //then
        XCTAssertEqual(LoginStateCases.loginFail, newLoginState.loginStateCase)
        
    }
    
    func testFirstRightLogin() throws {
        //given
        let loginState = LoginState(loginStateCase: .notLoggedIn)
        let loginAction = LoginSuccess(token: "123")
        
        //when
        let newLoginState = LoginReducer(loginState, loginAction)
        
        //then
        XCTAssertEqual(LoginStateCases.loggedIn, newLoginState.loginStateCase)
        
    }
    
    func testUnrelatedAction()throws {
        
        struct NonsenseAction: Action {
            
        }
        
        //given
        let loginStateInitial = LoginState(loginStateCase: .notLoggedIn)
    
        let randomAction = NonsenseAction()
        
        //when
        let newLoginState = LoginReducer(loginStateInitial, randomAction)
        
        //then
        XCTAssertEqual(loginStateInitial.loginStateCase, newLoginState.loginStateCase)
        
    }



}
