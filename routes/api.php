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

Route::get('/forums', 'ForumController@jsonForum')->name('json_forum');
Route::get('/forum/{id}', 'ForumController@jsonForumResponses')->name('json_forum_responses');

Route::get('/serba', 'SerbaController@jsonSerba')->name('json_serba');
