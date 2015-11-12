Contents
----
* [Connection](#connection)
* [Feed Item](#feed_item)
* [List](#list)
* [Meetup](#meetup)
* [Movie](#movie)
* [Person](#person)
* [Photo](#photo)
* [Showtime](#showtime)
* [Social Interaction](#social_interaction)
* [Tag](#tag)
* [User](#user)
* [Video](#video)


### Connection <a id="connection"></a>

```
include[connection]="
	user,
	connectable"
```
```
fields[connection]="
	publishStatus,
	notificationSms,
	notificationPush,
	notificationEmail,
	connectableType,
	connectableID,
	actionSlug",
fields[user]="
	facebookID,
	username,
	email,
	avatarURL,
	coverPhotoURL,
	fullName,
	unreadNorificationCount,
	wantToWatchesCount,
	followPersonCount,
	friendsCount,
	mutualWantToWatchesCount,
	mutualFollowingPersonCount,
	mutualFriendsCount,
	authenticationToken,
	actions",
fields[person]="
	name, 
	defaultImage"
```

### FeedItem <a id="feed_item"></a>

```
include[feed_item]="
	relationships,
	objects,
	targets,
	default_images"
```
```
fields[feed_item]="
	till,
	type,
	itemDescription,
	socialEndorsement,
	defaultImages,
	connections,
	objects,
	targets,
	actions"
fields[photo]="
	cloudinaryID,
	slug,
	averageColor,
	fileUrl,
	fileExtension,
	width,
	height,
	versions,
	portrait,
	landscape,
	name"
fields[video]="
	name,
	shortName,
	shortNameWithCategoryKey,
	category,
	videoDescription,
	fileURL,
	duration,
	thumbnails,
	ogTargetURL"
fields[movies]="
	name,
	relaseInfo,
	defaultImage,
	defaultVideo,
	director,
	casts,
	genres,
	stills,
	twitterHashTags,
	socialEndorsement,
	showtimes,
	counts,
	actions"
```

### List <a id="list"></a>

```
fields[list]="
	name,
	slug,
	userID,
	system"
```

### Meetup <a id="meetup"></a>

```
fields[meetup]="
	name,
	time,
	owner,
	location,
	movie,
	screenType,
	members"
```

### Movie <a id="movie"></a>

```
include[movie]="
	photos, 
	videos, 
	director"
```
```
fields[movies]="
	name,
	relaseInfo,
	defaultImage,
	defaultVideo,
	director,
	casts,
	genres,
	stills,
	twitterHashTags,
	socialEndorsement,
	showtimes,
	counts,
	actions"
fields[photo]="
	id,
	cloudinaryID,
	slug,
	averageColor,
	fileUrl,
	fileExtension,
	width,
	height,
	versions,
	portrait,
	landscape,
	name"
fields[video]="
	name,
	shortName,
	shortNameWithCategoryKey,
	category,
	videoDescription,
	fileURL,
	duration,
	thumbnails,
	ogTargetURL"
fields[person]="
	name,
	defaultImage"
```

### Person <a id="person"></a>

```
include[person]="
	movies,
	photos,
	videos"
```
```
fields[person]="
	name,
	defaultImage"
fields[movies]="
	name,
	relaseInfo,
	defaultImage,
	defaultVideo,
	director,
	casts,
	genres,
	stills,
	twitterHashTags,
	socialEndorsement,
	showtimes,
	counts,
	actions"
fields[photo]="
	cloudinaryID,
	slug,
	averageColor,
	fileUrl,
	fileExtension,
	width,
	height,
	versions,
	portrait,
	landscape,
	name"
fields[video]="
	name,
	shortName,
	shortNameWithCategoryKey,
	category,
	videoDescription,
	fileURL,
	duration,
	thumbnails,
	ogTargetURL"
```

### Photo <a id="photo"></a>

```
fields[photo]="
	cloudinaryID,
	slug,
	averageColor,
	fileUrl,
	fileExtension,
	width,
	height,
	versions,
	portrait,
	landscape,
	name"
```

### Showtime <a id="showtime"></a>

```
include[showtime]="
	movie,
	cinema"
```
```
fields[showtime]=
	time,
	ticketLink,
	ticketVendor,
	screenType,
	showtimeUID
fields[movies]="
	name,
	relaseInfo,
	defaultImage,
	defaultVideo,
	director,
	casts,
	genres,
	stills,
	twitterHashTags,
	socialEndorsement,
	showtimes,
	counts,
	actions"
fields[cinema]="
	name,
	address,
	coordinates,
	url"
```

### Social Interaction <a id="social_interaction"></a>

```
fields[social_interaction]="
	title,
	action,
	users"
```

### Tag <a id="tag"></a>

```
fields[tag]="
	name,
	slug"
```

### User <a id="user"></a>

```
fields[user]="
	facebookID,
	username,
	email,
	avatarURL,
	coverPhotoURL,
	fullName,
	unreadNorificationCount,
	wantToWatchesCount,
	followPersonCount,
	friendsCount,
	mutualWantToWatchesCount,
	mutualFollowingPersonCount,
	mutualFriendsCount,
	authenticationToken,
	actions" 
```

### Video <a id="video"></a>

```
include[video]="
	movie,
	person
"
```
```
fields[video]="
	name,
	shortName,
	shortNameWithCategoryKey,
	category,
	videoDescription,
	fileURL,
	duration,
	thumbnails,
	ogTargetURL"
fields[movies]="
	name,
	relaseInfo,
	defaultImage,
	defaultVideo,
	director,
	casts,
	genres,
	stills,
	twitterHashTags,
	socialEndorsement,
	showtimes,
	counts,
	actions"
fields[person]="
	name,
	defaultImage"
```
