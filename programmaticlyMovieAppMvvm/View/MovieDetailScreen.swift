//
//  MovieDetailScreen.swift
//  programmaticlyMovieAppMvvm
//
//  Created by Tuğberk Can Özen on 17.05.2022.
//

import UIKit
import SnapKit
import Kingfisher

class MovieDetailScreen: UIViewController {
    

    private let service = Services()
    private var detailResults: DetailResults
    var imdbID: String = String()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .systemIndigo
        return label
    }()
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .systemGray
        return label
    }()
    
    private let plotLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    init(detailResults: DetailResults) {
        self.detailResults = detailResults
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        addSubviews()
        drawDesign()
        setUp()
        makeContainerView()
    }
    
    func drawDesign() {
        view.backgroundColor = .white
        imageView.layer.cornerRadius = 100
    }
    
    func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(genreLabel)
        view.addSubview(plotLabel)
    }
    func setUp() {
        imageView.kf.setImage(with: URL(string: detailResults.poster))
        titleLabel.text = detailResults.title
        genreLabel.text = detailResults.genre
        plotLabel.text = detailResults.plot
    }
}

extension MovieDetailScreen {
    
    private func makeContainerView() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(view.frame.height / 2.24)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.equalTo(view).offset(8)
            make.right.equalTo(view).inset(8)
        }

        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(view).offset(8)
            make.right.equalTo(view).inset(8)
        }

        plotLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(8)
            make.left.equalTo(view).offset(8)
            make.right.equalTo(view).inset(8)
        }
    }
}
