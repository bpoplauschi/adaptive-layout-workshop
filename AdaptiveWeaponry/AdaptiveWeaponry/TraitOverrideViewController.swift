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

class TraitOverrideViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    performTraitCollectionOverrideForSize(view.bounds.size)
  }
  
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    performTraitCollectionOverrideForSize(size)
    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
  }
  
  private func performTraitCollectionOverrideForSize(size: CGSize) {
    var overrideTraitCollection: UITraitCollection? = nil
    if size.width > 320 {
      overrideTraitCollection = UITraitCollection(horizontalSizeClass: .Regular)
    }
    for vc in self.childViewControllers as [UIViewController] {
      setOverrideTraitCollection(overrideTraitCollection, forChildViewController: vc)
    }
  }
  
}
