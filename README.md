# BackgroundURLSessionDemo
Demo background NSURLSession

* Both extension and the app can initiate a URLSession request and then go to sleep or even get killed.
* The real downloading work is done in a system-managed process and will continue until download is completed.
* After comletion, the system will wake up the app into background mode, and call the designated delegate.

* Because the download finish time is not predetermined, the delegate could be called in either the extension process or the app process, so it's necessary to implement the delegate method in both process, and the state should be handled properly.
