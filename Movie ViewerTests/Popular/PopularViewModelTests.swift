//
//  PopularViewModelTests.swift
//  Movie ViewerTests
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import XCTest
@testable import Movie_Viewer

final class PopularViewModelTests: XCTestCase {
    
    func testFetchMovies() {
        let viewModel = PopularViewModel()
        let expectation = XCTestExpectation(description: "Fetch movies")
        
        viewModel.fetchMovies {
            XCTAssertNotNil(viewModel.popularMovies)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testMovieListViewModelInitialization() {
        let viewModel = PopularViewModel()
        XCTAssertNotNil(viewModel)
    }
    
    func testFetchMoviesModel() {
        
        let viewModel = PopularViewModel()
        
        let mockMovie = MockData.mockMovie
        let expectedMovies: PopularMovies = PopularMovies(page: 1, results: [mockMovie], total_pages: 41263, total_results: 825251)
        let expectation = XCTestExpectation(description: "Fetch movies")
        
        viewModel.fetchMovies {
            if let movies = viewModel.popularMovies {
                XCTAssertEqual(movies.results.first?.title, expectedMovies.results.first?.title)
                XCTAssertEqual(movies.results.first?.id, expectedMovies.results.first?.id)
            } else {
                XCTFail("Fetch movies failed")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
