//
//  PopularCellTests.swift
//  Movie ViewerTests
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation
import XCTest
@testable import Movie_Viewer

class PopularCellTests: XCTestCase {
    var popularCell: PopularCell!
    
    override func setUp() {
        super.setUp()
        popularCell = Bundle.main.loadNibNamed("PopularCell", owner: nil, options: nil)?.first as? PopularCell
    }
    
    override func tearDown() {
        popularCell = nil
        super.tearDown()
    }

    func testOutletsAreConnected() {
        popularCell.contentView.layoutIfNeeded()
        
        XCTAssertNotNil(popularCell.dateLabel)
        XCTAssertNotNil(popularCell.titleLabel)
        XCTAssertNotNil(popularCell.posterImage)
    }
    
    func testPopulate() {
        let movie = MockData.mockMovie
        
        popularCell.populate(movie: movie)
        
        XCTAssertEqual(popularCell.titleLabel.text, "Mission: Impossible - Dead Reckoning Part One")
        XCTAssertEqual(popularCell.dateLabel.text, "2023-07-08")
        
    }
    
    func testPopulateWithNilMovie() {
        popularCell.populate(movie: nil)
        XCTAssertNil(popularCell.titleLabel.text)
        XCTAssertNil(popularCell.dateLabel.text)
    }
    
    func testImageViewLoading() {
        let movie = MockData.mockMovie
        popularCell.populate(movie: movie)
        let imageExpectation = expectation(description: "Image should load")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssertNotNil(self.popularCell.posterImage.image)
            imageExpectation.fulfill()
        }
        waitForExpectations(timeout: 5.0) { error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error)")
            }
        }
    }
    
}
