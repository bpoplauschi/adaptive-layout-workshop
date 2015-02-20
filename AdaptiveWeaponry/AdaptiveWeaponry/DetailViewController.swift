//
// Copyright 2014 Scott Logic
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partOfSpeechLabel: UILabel!
    @IBOutlet weak var furtherDetailLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet var tallLayoutConstraints: [NSLayoutConstraint]!
    
    @IBOutlet var wideLayoutConstraints: [NSLayoutConstraint]!
    
    var weapon: Weapon? {
        didSet {
            // Update the view.
            if isViewLoaded() {
                self.configureView()
            }
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let weapon = self.weapon {
            self.title = weapon.name
            self.imageView.image = weapon.image
            self.nameLabel.text = weapon.name
            self.partOfSpeechLabel.text = weapon.partOfSpeech
            self.furtherDetailLabel.text = weapon.alternative
            self.descriptionLabel.text = weapon.detail
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        self.setupConstraingsForSize(view.bounds.size)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        self.setupConstraingsForSize(size)
    }
    
    private func setupConstraingsForSize(size: CGSize) {
        view.layoutIfNeeded()
        
        if (size.width >= size.height) {
            // Side-by-side layout
            NSLayoutConstraint.deactivateConstraints(self.tallLayoutConstraints)
            NSLayoutConstraint.activateConstraints(self.wideLayoutConstraints)
        } else {
            // On-top-of layout
            NSLayoutConstraint.deactivateConstraints(self.wideLayoutConstraints)
            NSLayoutConstraint.activateConstraints(self.tallLayoutConstraints)
        }
        
        view.layoutIfNeeded()
    }
}

