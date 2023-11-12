//
//  PopularViewController.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import UIKit

class PopularViewController: UIViewController, UISearchResultsUpdating  {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = PopularViewModel()
    
    var isSorted: Bool {
        get {
            return !(self.navigationItem.searchController?.searchBar.text?.isEmpty ?? true)
        }
    }
    
    var movies: [Movie]? {
        get {
            return isSorted ? viewModel.sortedMovies?.results : viewModel.popularMovies?.results
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupUI() {
        tableView.register(UINib(nibName: "PopularCell", bundle: nil), forCellReuseIdentifier: "PopularCell")
        self.title = "Popular Movies"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Movies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text)
    }
    
    func filterContentForSearchText(_ searchText: String?) {
        if let searchText = searchText, !searchText.isEmpty {
            let sortedMoviews = viewModel.popularMovies?.results.filter({$0.title.lowercased().contains(searchText.lowercased())})
            viewModel.sortedMovies?.results = sortedMoviews ?? []
        }
        tableView.reloadData()
    }
    
}

extension PopularViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCell", for: indexPath) as! PopularCell
        let movie = movies?[indexPath.row]
        cell.populate(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = movies?[indexPath.row] else { return }
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailVC.viewModel = DetailViewModel(movie: movie)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
