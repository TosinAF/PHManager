<p align="center"><img src="https://raw.githubusercontent.com/karan/Hook/master/logo.png"></p>

PHManager
====

Objective-C Wrapper for the Unofficial ProductHunt API [Hook](https://github.com/karan/Hook) (developed by [@karangoel](https://twitter.com/karangoel)) for retrieving today's hunts and comments for any post. 

*Note: This is an API Wrapper using an unofficial API and __not__ supported or controlled by ProductHunt itself. Any questions, comments, feedback or feature requests for the API Wrapper should be directed to [tosin](http://github.com/tosin) or via an issue in this repo. 

Any questions, comments, feedback or feature requests related to the API should be directed to [karan](http://github.com/karan) or via an [issue](https://github.com/karan/Hook/issues) in his repo.*

Usage
=====

Add the PHManager folder to your project; including the Models.

###### `#import "PHManager.h"`

### Get today's products

Posts are cached for 60 minutes.

```
- (void)getTodaysProductsWithSuccess:(void (^) (NSArray *products))success failure:(RequestFailureBlock)failure;
```

Example Code:

```
[[PHManager sharedManager] getTodaysProductsWithSuccess:^(NSArray *products) {

        NSLog(@"Products Download Successful");

        for (PHProduct *product in products) {

            NSLog(@"%@", [product titleWithTagline]);
            NSLog(@"%@", [[product hunter] name]);
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        NSLog(@"The task: %@ failed with error: %@", task, error);
    }
];


```

Success Callback with an NSArray of PHProducts (In Ascending Order).

### Get comments for any post

Comments are cached for 120 minutes.

```
- (void)getCommentsForProduct:(PHProduct *)product success:(void (^) (NSArray *comments))success failure:(RequestFailureBlock)failure
```

Example Query:

```
[[PHManager sharedManager] getCommentsForProduct:product success:^(NSArray *comments) {

        NSLog(@"Comments Download Successful");

        for (PHComment *comment in comments) {
            NSLog(@"%@", [comment comment]);
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        NSLog(@"The task: %@ failed with error: %@", task, error);
        
    }
];

```

Success Callback with an NSArray of PHComments.

### Data Models

There are 3 Data Models namely: PHProduct, PHComment & PHUser


##### PHProduct

```
NSString *title;
NSString *tagline;
NSString *titleWithTagline;
NSString *URL;
NSString *permalink;
NSNumber *rank;
NSNumber *voteCount;
NSNumber *commentCount;
PHUser *hunter;
```

##### PHComment

```
NSNumber *index;
NSString *comment;
NSString *commentHTML;
NSString *timestamp;
PHUser *hunter;
```

##### PHUser

```
NSString *name;
NSString *username;
```

Expo
=======

Some apps built using this API:

| Name | Description | URL |
| ---- | ---- | ---- |
| TheNews (iOS) | PH, DN & HN, now on iOS | https://appsto.re/us/PpnV0.i |

*If you are using PHManager, please let me know and I'll showcase your app here.*



