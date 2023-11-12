//
//  DetailViewControllerTests.swift
//  Movie ViewerTests
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import XCTest
@testable import Movie_Viewer

class DetailViewControllerTests: XCTestCase {
    var detailViewController: DetailViewController!
    
    override func setUp() {
        super.setUp()
        let mockViewModel = DetailViewModel(movie: nil)
        detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        detailViewController.viewModel = mockViewModel
        detailViewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        detailViewController = nil
        super.tearDown()
    }
    
    func testViewModelNotNil() {
        XCTAssertNotNil(detailViewController.viewModel)
    }
    
    func testOutletsAreConnected() {
        XCTAssertNotNil(detailViewController.posterImage)
        XCTAssertNotNil(detailViewController.titleLabel)
        XCTAssertNotNil(detailViewController.tagLineLabel)
        XCTAssertNotNil(detailViewController.genresLabel)
        XCTAssertNotNil(detailViewController.dateLabel)
        XCTAssertNotNil(detailViewController.overviewLabel)
    }

    func testSetupUI() {
        let mockMovie = MockData.mockPopularMovie
        detailViewController.viewModel.popularMovie = mockMovie
        
        detailViewController.setupUI()
        
        XCTAssertEqual(detailViewController.titleLabel.text, "Sample Movie")
        XCTAssertEqual(detailViewController.tagLineLabel.text, "A sample tagline")
        XCTAssertEqual(detailViewController.dateLabel.text, "2023-01-01")
        XCTAssertEqual(detailViewController.genresLabel.text, mockMovie.genres.map { $0.name }.joined(separator: " . "))
        XCTAssertEqual(detailViewController.overviewLabel.text, "This is a sample movie overview.")
    }
}
