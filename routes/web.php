<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::get('/', 'HomeController@welcome')->name('welcome')->middleware('admin');

Route::get('/admin/serba-serbi', 'SerbaController@serbaSerbi')->name('serba')->middleware('admin');;
Route::get('/admin/create-serba-serbi', 'SerbaController@create')->name('create_serba')->middleware('admin');;
Route::get('/admin/preview-serba-serbi/{id}', 'SerbaController@preview')->name('preview_serba')->middleware('admin');
Route::post('/admin/post-serba-serbi', 'SerbaController@post')->name('post_serba')->middleware('admin');
Route::get('/admin/edit-serba-serbi/{id}', 'SerbaController@edit')->name('edit_serba')->middleware('admin');
Route::post('/admin/update-serba-serbi/{id}', 'SerbaController@update')->name('update_serba')->middleware('admin');
Route::post('/admin/delete-serba-serbi/{id}', 'SerbaController@delete')->name('delete_serba')->middleware('admin');
Route::post('ckeditor/upload_image', 'SerbaController@uploadImage')->name('upload_image');

Route::get('/admin/forum', 'ForumController@forum')->name('forum')->middleware('admin');
Route::post('/admin/delete-forum/{id}', 'ForumController@delete')->name('delete_forum')->middleware('admin');

Route::get('/admin/faq', 'FAQController@faq')->name('faq')->middleware('admin');
Route::post('/admin/post_faq', 'FAQController@post')->name('post_faq')->middleware('admin');
Route::post('/admin/update_faq', 'FAQController@update')->name('update_faq')->middleware('admin');
Route::post('/admin/delete_faq/{id}', 'FAQController@delete')->name('delete_faq')->middleware('admin');

Route::get('/admin/users', 'UserController@users')->name('users')->middleware('admin');
Route::post('/admin/users/{id}/delete', 'UserController@delete')->name('user.delete')->middleware('admin');

Route::get('/admin/settings', 'UserController@settings')->name('settings')->middleware('admin');
Route::post('/admin/change-pass', 'UserController@changePassword')->name('changePassword')->middleware('admin');

Route::get('/webview/serba/{id}', 'SerbaController@webview')->name('webview');
Route::get('/webview/image/', 'HomeController@viewImage')->name('view.image');
Route::get('/err/{tipe}', 'HomeController@err')->name('error');
