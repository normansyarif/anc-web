<?php

/*
 * Helper Class
 *
 */

namespace App;
use Carbon\Carbon;

class Tool
{
  private static $key = "ancprivate_2019";

  public static function json($data){
    header("Content-type:application/json");
    return json_encode($data);
  }

  public static function storeImage($img, $location, $name){
    $name = $name . '.png';
    $binary = base64_decode($img);
    header('Content-Type: bitmap; charset=utf-8');
    $file = fopen($location.$name, 'wb');

    if(fwrite($file, $binary)){
      fclose($file);
      return true;
    } else {
      fclose($file);
      return false;
    }
  }

  public static function now(){
      $date = Carbon::now();
      return self::convertDateIndonesia($date->format("Y-m-d"));
  }

  public static function convertDateIndonesia($tanggal){
    $bulan = array (1 => 'Januari',
                				 'Februari',
                				 'Maret',
                				 'April',
                				 'Mei',
                				 'Juni',
                				 'Juli',
                				 'Agustus',
                				 'September',
                				 'Oktober',
                				 'November',
                				 'Desember'
                			);

  	$split = explode('-', $tanggal);
  	return $split[2] . ' ' . $bulan[ (int)$split[1] ] . ' ' . $split[0];
  }

  public static function hari($tanggal){
    $timestamp = strtotime($tanggal);
    $hari = date ("D", $timestamp);

    	switch($hari){
    		case 'Sun':
    			$hari_ini = "Minggu";
    		break;

    		case 'Mon':
    			$hari_ini = "Senin";
    		break;

    		case 'Tue':
    			$hari_ini = "Selasa";
    		break;

    		case 'Wed':
    			$hari_ini = "Rabu";
    		break;

    		case 'Thu':
    			$hari_ini = "Kamis";
    		break;

    		case 'Fri':
    			$hari_ini = "Jumat";
    		break;

    		default:
    			$hari_ini = "Sabtu";
    		break;
      }

      return $hari_ini;
  }

  public static function encrypt($data) {
      $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
      $encrypted = openssl_encrypt($data, 'aes-256-cbc', self::$key, 0, $iv);
      return self::base64_url_encode($encrypted . '::' . $iv);
  }

  public static function decrypt($data) {
    try {
      list($encrypted_data, $iv) = explode('::', self::base64_url_decode($data), 2);
      return openssl_decrypt($encrypted_data, 'aes-256-cbc', self::$key, 0, $iv);
    } catch (Exception $e) {
      return false;
    }
  }

  public static function bcrypt($value){
    return password_hash($value, PASSWORD_BCRYPT);
  }

  public static function verify($value, $hash){
    return password_verify($value, $hash);
  }

  static function base64_url_encode($input) {
   return strtr(base64_encode($input), '+/=', '._-');
  }

  static function base64_url_decode($input) {
   return base64_decode(strtr($input, '._-', '+/='));
  }

}
