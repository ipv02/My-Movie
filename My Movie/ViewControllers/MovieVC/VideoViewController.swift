
import UIKit
import youtube_ios_player_helper

class VideoViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet var playerView: YTPlayerView!
    
    var resultVideo: ResultVideo!
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        playerView.delegate = self
        playerView.load(withVideoId: resultVideo?.key ?? "")
    }
    
    private func setupNavigationBar() {
        
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            topItem.backBarButtonItem?.tintColor = .black
        }
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
