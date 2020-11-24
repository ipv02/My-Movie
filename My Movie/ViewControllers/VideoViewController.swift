
import UIKit
import youtube_ios_player_helper

class VideoViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet var playerView: YTPlayerView!
    
    var resultVideo: ResultVideo!
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.delegate = self
        playerView.load(withVideoId: resultVideo?.key ?? "")
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
