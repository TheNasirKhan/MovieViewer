//
//  PopularViewControllerTests.swift
//  Movie ViewerTests
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import XCTest
@testable import Movie_Viewer

class PopularViewControllerTests: XCTestCase {
    var popularViewController: PopularViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        popularViewController = storyboard.instantiateViewController(withIdentifier: "PopularViewController") as? PopularViewController
        popularViewController.loadViewIfNeeded()
    }

    override func tearDown() {
        popularViewController = nil
        super.tearDown()
    }

    func testTableViewNotNil() {
        XCTAssertNotNil(popularViewController.tableView)
    }

    func testViewModelNotNil() {
        XCTAssertNotNil(popularViewController.viewModel)
    }

    func testSearchControllerNotNil() {
        XCTAssertNotNil(popularViewController.navigationItem.searchController)
    }

    func testTitleIsPopularMovies() {
        XCTAssertEqual(popularViewController.title, "Popular Movies")
    }

    func testNumberOfRowsInTableView() {
        let numberOfRows = popularViewController.tableView(popularViewController.tableView, numberOfRowsInSection: 0)
        XCTAssertGreaterThanOrEqual(numberOfRows, 0)
    }

    func testCellForRowAtIndexPath() {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = popularViewController.tableView(popularViewController.tableView, cellForRowAt: indexPath) as? PopularCell
        XCTAssertNotNil(cell)
    }

    func testUpdateSearchResults() {
        let searchController = UISearchController(searchResultsController: nil)
        popularViewController.updateSearchResults(for: searchController)
    }

    func testFilterContentForSearchText() {
        let searchText = "Sample"
        popularViewController.filterContentForSearchText(searchText)
    }
}

