//
//  MovieListCell.swift
//  programmaticlyMovieAppMvvm
//
//  Created by Tuğberk Can Özen on 12.05.2022.
//

import UIKit
import SnapKit
import Kingfisher

class MovieHomeTableViewCell: UITableViewCell {

        // MARK: - UI Elements
        
        // Labels
        private let cellTitleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.font = .boldSystemFont(ofSize: 20)
            return label
        }()
        
        private let cellMovieYearLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            return label
        }()
        
        // ImageViews
        private var cellImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 75
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 5
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.image = UIImage(named: "movieConstantImage")
            imageView.snp.makeConstraints { make in
                make.height.width.equalTo(150)
            }
            return imageView
        }()
        
        private let cellRightArrow: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "arrow.right")
            imageView.tintColor = .lightGray
            return imageView
        }()
        
        // StackViews
        private let verticalStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.distribution = .fill
            stackView.spacing = 5
            return stackView
        }()
        private let horizontalStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fill
            stackView.spacing = 20
            return stackView
        }()
        
        // MARK: - Identifier
        enum Identifier: String {
            case custom = "tableViewCellIdentifier"
        }
        
        // MARK: - Life Cycle
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Functions
        private func configure() {
            drawDesign()
            addSubviews()
            makeHorizontalStackView()
            makeCellRightArrow()
            makeVerticalStackView()
        }
        
        private func drawDesign() {
            contentView.layer.cornerRadius = 75
            contentView.backgroundColor = .lightGray.withAlphaComponent(0.2)
            contentView.layer.borderWidth = 3
            contentView.layer.borderColor = UIColor.white.cgColor
        }
        
        private func addSubviews() {
            addSubview(horizontalStackView)
            addSubview(cellRightArrow)
            
            horizontalStackView.addArrangedSubview(cellImageView)
            horizontalStackView.addArrangedSubview(verticalStackView)
            
            verticalStackView.addArrangedSubview(cellTitleLabel)
            verticalStackView.addArrangedSubview(cellMovieYearLabel)
        }
        
        func saveModel(model: Search) {
            cellTitleLabel.text = model.title
            cellMovieYearLabel.text = model.year
            cellImageView.kf.setImage(with: URL(string: model.poster))
        }
    }

    extension MovieHomeTableViewCell {
        
        private func makeHorizontalStackView(){
            horizontalStackView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalTo(contentView)
            }
        }
        
        private func makeVerticalStackView(){
            verticalStackView.snp.makeConstraints { make in
                make.right.equalTo(cellRightArrow.snp.left).inset(5)
            }
        }
        
        private func makeCellRightArrow() {
            cellRightArrow.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().inset(25)
            }
        }
    }
