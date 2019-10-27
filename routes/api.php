<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('/faqs', 'FAQController@jsonFaq')->name('json_faq');
Route::get('/faq/{id}', 'FAQController@jsonFaqItem')->name('json_faq_item');

Route::get('/forums',     'ForumController@jsonForum')->name('json_forum');
Route::get('/forum/{id}', 'ForumController@jsonForumResponses')->name('json_forum_responses');
Route::get('/imgForum/{id}/{index}', 'APIForumController@imgFoto');
Route::post('/newForum',    'APIForumController@newForum');
Route::post('/newResponse', 'APIForumController@newResponse');

Route::get('/serba', 'SerbaController@jsonSerba')->name('json_serba');

// ----- user

Route::post('/register', 'APIUserController@register');
Route::post('/login', 'APIUserController@login');
Route::post('/editProfile', 'APIUserController@profile');
Route::get('/imgProfile/{token}', 'APIUserController@imgProfile');

// ----- Chat

Route::get('/chats/{token}', 'ChatController@chats');
Route::post('/newChat', 'ChatController@newChat');
Route::get('/imgChat/{id}', 'ChatController@imgFoto');
