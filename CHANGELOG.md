## 0.1.0

- First public release.

## 0.1.1

- Fix casting errors in List operations

## 0.2.0

- **BREAKING**: `getAccountReputations` now returns `List<AccountReputation>`
- `lookupAccounts` now returns `List<String>` instead of `List<dynamic>`
- Fix more casting errors in List operations
- Add tests for all public functions

## 0.2.1

- Remove unused `getFeedJson`

## 0.3.0

- Make account history JSON parser support indices; required for community support

## 0.3.1

- Allow null for VideoInfo.platform
- Add fields spritehash and snaphash to VideoInfo

## 0.4.0

- Add getDiscussionsBy

## 0.4.1

- Fix return type of getDiscussionsBy

## 0.4.2

- Misc serialization failures

## 0.4.3

- Handle String Post.jsonMetadata

## 0.4.4

- Remove accidentally published code that breaks interface

## 0.4.5

- Allow JsonRpcError.data to be String (sometimes Hive returns this)

## 0.4.6

- Throw NotFoundFailure on Hive error -31999