//
//  FoodInteractor.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 12/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import MBProgressHUD

class FoodInteractor: IFoodInteractor {
    
    // MARK: - UI Components
    
    private let tableView: UITableView
    private let clearCacheButton: UIButton
    private let imageLoaderSwitcher: UISegmentedControl
    
    // MARK: - Alerts
    
    private let alertAssistant: IAlertAssistant
    
    // MARK: - Services
    
    private let dataLoader: IDataLoader = DataLoader(baseUrl: Constants.baseUrl)
    private let tableViewFlow: ITableViewFlow = TableViewFlow()
    
    // MARK: - Memory Management
    
    private weak var presenter: UIViewController?
    
    init(_ presenter: UIViewController) {
        self.presenter = presenter
        self.alertAssistant = AlertAssistant(presenter)
        let componentBuilder: IComponentBuilder = ComponentBuilder()
        self.tableView = componentBuilder.buildTableView(addedTo: presenter.view)
        self.clearCacheButton = componentBuilder.buildClearCacheButton(addedTo: presenter.view)
        self.imageLoaderSwitcher = componentBuilder.buildImageLoaderSwitcher(addedTo: presenter.view)
        initialConfigurations()
    }
    
    // MARK: - IContractInteractor
    
    @discardableResult
    func tryGetFoodData() -> CanStart {
        guard let presenter = presenter else {
            return false
        }
        prepare(presenter.view)
        dataLoader.getModels()
            .done{ [unowned self] models in
                self.update(with: models)
            }
            .catch{ [unowned self] error in
                self.showAlert(error)
            }
            .finally { [unowned self] in
                self.finish(presenter.view)
        }
        
        return true
    }
    
    // MARK: - Initial Configurations
    
    private func initialConfigurations() {
        configureTableView()
        configureClearCacheButton()
        configureImageLoaderSwitcher()
    }
    
    // MARK: - Components Configurations
    
    private func configureTableView() {
        tableViewFlow.configure(tableView)
    }
    
    private func configureClearCacheButton() {
        clearCacheButton.setTitle("Clear Cache", for: .normal)
        clearCacheButton.setTitleColor(.gray, for: .normal)
        clearCacheButton.addTarget(self, action: #selector(clearCache(_ :)), for: .touchUpInside)
    }
    
    private func configureImageLoaderSwitcher() {
        Loader.all.enumerated().forEach {
            imageLoaderSwitcher.insertSegment(withTitle: $0.1.title, at: $0.0, animated: false)
        }
        imageLoaderSwitcher.selectedSegmentIndex = tableViewFlow.imageLoader.index
        imageLoaderSwitcher.addTarget(self, action: #selector(switchImageLoader(_ :)), for: .valueChanged)
    }
    
    // MARK: - Actions
    
    @objc
    private func clearCache(_ sender: UIButton) {
        tableViewFlow.clearCache()
    }
    
    @objc
    private func switchImageLoader(_ sender: UISegmentedControl) {
        let newLoader = Loader(value: sender.selectedSegmentIndex)
        tableViewFlow.update(loader: newLoader)
        tableViewFlow.tryReloadData()
    }
    
    // MARK: - Auxiliary Actions
    
    private func prepare(_ view: UIView) {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    private func finish(_ view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    private func showAlert(_ error: Error) {
        alertAssistant.tryShowAlert(title: "\(error.localizedDescription)") { [unowned self] in
            self.tryGetFoodData()
        }
    }
    
    private func update(with models: [FoodModel]) {
        tableViewFlow.update(with: models)
        tableViewFlow.tryReloadData()
    }
}
