import UIKit

class ViewController: UIViewController {
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, AR App!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let counterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tapped: 0", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        view.addSubview(helloLabel)
        view.addSubview(counterButton)
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            counterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func setupActions() {
        counterButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        counter += 1
        counterButton.setTitle("Tapped: \(counter)", for: .normal)
    }
}