import Foundation
import UIKit


class SampleViewController: UIViewController{
    private lazy var pushViewButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push Next View", for: .normal)
        button.addTarget(self, action: #selector(self.pushViewButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Initial Native Screen"
        self.view.backgroundColor = .white
        self.view.addSubview(pushViewButton)
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupConstraints(){
        pushViewButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pushViewButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func pushViewButtonTapped(){
        self.navigationController?.pushViewController(FirstViewController(), animated: true)
    }
}

class FirstViewController: UIViewController{
    
    private lazy var showModalButton = {
        let button = UIButton(type: .system)
        button.setTitle("show Modal View", for: .normal)
        button.addTarget(self, action: #selector(self.showModalTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First Native Screen"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view.backgroundColor = .white
        self.view.addSubview(showModalButton)
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupConstraints(){
        showModalButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        showModalButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func showModalTapped(){
        let modalViewController = ModalViewController { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        let navigationController = UINavigationController(rootViewController: modalViewController)
        navigationController.configureNavigationBar()
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

class ModalViewController: UIViewController {
    
    init(completion: @escaping (()->Void)){
        dismissCompletion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        dismissCompletion = nil
        super.init(coder: coder)
    }
    
    private let dismissCompletion: (()->())?
    
    private lazy var dismissButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dismiss Button", for: .normal)
        button.addTarget(self, action: #selector(self.dismissButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Modal View"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view.backgroundColor = .white
        self.view.addSubview(dismissButton)
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        dismissButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func dismissButtonTapped(){
        if let dismissCompletion = self.dismissCompletion  {
            dismissCompletion()
        }
        self.dismiss(animated: true) {
            print("Dismiss done")
        }
    }
}
