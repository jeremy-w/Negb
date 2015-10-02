//
//  NegbTests.swift
//  NegbTests
//
//  Created by Jeremy on 2015-10-02.
//  Copyright © 2015 Jeremy W. Sherman. Distributed under the terms of the ISC license.
//
//  This worked under Xcode Version 7.0.1 (7A1001).

import XCTest

enum Bool_ {
    case True
    case False
}



func negb(b: Bool_) -> Bool_ {
    switch b {
    case .True: return .False
    case .False: return .True
    }
}


func corruptedNegb(b: Bool_) -> Bool_ {
    switch b {
    case .True: return .True
    case .False: return .True
    }
}



extension Bool_: Arbitrary {
    static var arbitrary : Gen<Bool_> {
        return Gen.oneOf([Gen.pure(.True), Gen.pure(.False)])
    }
}



class NegbTests: XCTestCase {
    /// Generative testing of the `negb_inverse` theorem's claim.
    func testTheoremNegbInverse() {
        property("negb is its own inverse") <- forAll { (b: Bool_) in
            return negb(negb(b)) == b
        }
    }

    /// Generative testing of the `negb_inverse` theorem's claim
    /// against the corrupted definition of `negb`.
    func testTheoremNegbInverseFailsForCorruptedVersion() {
        property("corrupted negb is its own inverse") <- forAll { (b: Bool_) in
            return corruptedNegb(corruptedNegb(b)) == b
        }.expectFailure
    }
}
