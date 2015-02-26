<?php
   function ValidateEmail($email)
   {
      $pattern = '/^([0-9a-z]([-.\w]*[0-9a-z])*@(([0-9a-z])+([-\w]*[0-9a-z])*\.)+[a-z]{2,6})$/i';
      return preg_match($pattern, $email);
   }

   if ($_SERVER['REQUEST_METHOD'] == 'POST')
   {
      $mailto = 'moika-77@mail.ru';
      $mailfrom = isset($_POST['email']) ? $_POST['email'] : $mailto;
      $subject = 'заявка с сайта';
      $message = 'Values submitted from web site form:';
      $success_url = './page2.html';
      $error_url = '';
      $error = '';
      $eol = "\n";
      $max_filesize = isset($_POST['filesize']) ? $_POST['filesize'] * 1024 : 1024000;
      $boundary = md5(uniqid(time()));

      $header  = 'From: '.$mailfrom.$eol;
      $header .= 'Reply-To: '.$mailfrom.$eol;
      $header .= 'MIME-Version: 1.0'.$eol;
      $header .= 'Content-Type: multipart/mixed; boundary="'.$boundary.'"'.$eol;
      $header .= 'X-Mailer: PHP v'.phpversion().$eol;
      if (!ValidateEmail($mailfrom))
      {
         $error .= "The specified email address is invalid!\n<br>";
      }

      if (!empty($error))
      {
         $errorcode = file_get_contents($error_url);
         $replace = "##error##";
         $errorcode = str_replace($replace, $error, $errorcode);
         echo $errorcode;
         exit;
      }

      $internalfields = array ("submit", "reset", "send", "captcha_code");
      $message .= $eol;
      $message .= "IP Address : ";
      $message .= $_SERVER['REMOTE_ADDR'];
      $message .= $eol;
      foreach ($_POST as $key => $value)
      {
         if (!in_array(strtolower($key), $internalfields))
         {
            if (!is_array($value))
            {
               $message .= ucwords(str_replace("_", " ", $key)) . " : " . $value . $eol;
            }
            else
            {
               $message .= ucwords(str_replace("_", " ", $key)) . " : " . implode(",", $value) . $eol;
            }
         }
      }

      $body  = 'This is a multi-part message in MIME format.'.$eol.$eol;
      $body .= '--'.$boundary.$eol;
      $body .= 'Content-Type: text/plain; charset=UTF-8'.$eol;
      $body .= 'Content-Transfer-Encoding: 8bit'.$eol;
      $body .= $eol.stripslashes($message).$eol;
      if (!empty($_FILES))
      {
          foreach ($_FILES as $key => $value)
          {
             if ($_FILES[$key]['error'] == 0 && $_FILES[$key]['size'] <= $max_filesize)
             {
                $body .= '--'.$boundary.$eol;
                $body .= 'Content-Type: '.$_FILES[$key]['type'].'; name='.$_FILES[$key]['name'].$eol;
                $body .= 'Content-Transfer-Encoding: base64'.$eol;
                $body .= 'Content-Disposition: attachment; filename='.$_FILES[$key]['name'].$eol;
                $body .= $eol.chunk_split(base64_encode(file_get_contents($_FILES[$key]['tmp_name']))).$eol;
             }
         }
      }
      $body .= '--'.$boundary.'--'.$eol;
      if ($mailto != '')
      {
         mail($mailto, $subject, $body, $header);
      }
      header('Location: '.$success_url);
      exit;
   }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Untitled Page</title>
<meta name="keywords" content="Автомойки Москвы, автомойки, автомойка, лучшие автомойки Москвы, автомойки с онлайн-трансляцией, онлайн-запись на автомойку,"/>
<meta name="generator" content="WYSIWYG Web Builder 9 - http://www.wysiwygwebbuilder.com"/>
<link href="Untitled1.css" rel="stylesheet" type="text/css"/>
<link href="index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="swfobject.js"></script>
<script type="text/javascript">
function ValidateForm1(theForm)
{
   var regexp;
   if (theForm.Editbox1.value == "")
   {
      alert("введите имя");
      theForm.Editbox1.focus();
      return false;
   }
   if (theForm.Editbox2.value == "")
   {
      alert("введите e-mail");
      theForm.Editbox2.focus();
      return false;
   }
   if (theForm.Editbox3.value == "")
   {
      alert("введите телефон");
      theForm.Editbox3.focus();
      return false;
   }
   if (theForm.Editbox4.value == "")
   {
      alert("введите название мойки");
      theForm.Editbox4.focus();
      return false;
   }
   if (theForm.Editbox5.value == "")
   {
      alert("введите адрес мойки");
      theForm.Editbox5.focus();
      return false;
   }
   return true;
}
</script>
<script type="text/javascript">
function ValidateForm2(theForm)
{
   var regexp;
   if (theForm.Editbox6.value == "")
   {
      alert("введите имя");
      theForm.Editbox6.focus();
      return false;
   }
   if (theForm.Editbox7.value == "")
   {
      alert("введите e-mail");
      theForm.Editbox7.focus();
      return false;
   }
   if (theForm.Editbox9.value == "")
   {
      alert("введите подтверждение пароля");
      theForm.Editbox9.focus();
      return false;
   }
   if (theForm.Editbox8.value == "")
   {
      alert("введите пароль");
      theForm.Editbox8.focus();
      return false;
   }
   return true;
}
</script>
</head>
<body>
<div id="Layer7" style="position:absolute;text-align:center;left:0px;top:5360px;width:103%;height:550px;z-index:72;" title="">
<div id="Layer7_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Image4" style="position:absolute;left:250px;top:470px;width:40px;height:34px;z-index:0;">
<img src="images/arrow2_24.png" id="Image4" alt="" style="width:40px;height:34px;"/></div>
<div id="wb_Shape2" style="position:absolute;left:300px;top:460px;width:350px;height:60px;z-index:1;">
<a href="#bookmark1"><img src="images/img0016.png" id="Shape2" alt="" style="border-width:0;width:350px;height:60px;"/></a></div>
<div id="wb_Image5" style="position:absolute;left:660px;top:470px;width:40px;height:34px;z-index:2;">
<img src="images/img0017.png" id="Image5" alt="" style="width:40px;height:34px;"/></div>
</div>
</div>
<div id="Layer3" style="position:absolute;text-align:center;left:0px;top:1270px;width:103%;height:528px;z-index:73;" title="">
<div id="Layer3_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
</div>
</div>
<div id="Layer4" style="position:absolute;text-align:center;left:0px;top:3170px;width:103%;height:510px;z-index:74;" title="">
<div id="Layer4_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape13" style="position:absolute;left:310px;top:240px;width:370px;height:70px;z-index:5;">
<a href="#bookmark1"><img src="images/img0012.png" id="Shape13" alt="" style="border-width:0;width:370px;height:70px;"/></a></div>
<div id="wb_Shape17" style="position:absolute;left:0px;top:30px;width:119px;height:50px;z-index:6;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0028.png" id="Shape17" alt="" style="border-width:0;width:119px;height:50px;"/></a></div>
<div id="wb_Shape23" style="position:absolute;left:310px;top:100px;width:380px;height:70px;z-index:7;">
<a href="http://www.moika-77.ru/car_washes/894 " target="_blank"><img src="images/img0030.png" id="Shape23" alt="" style="border-width:0;width:380px;height:70px;"/></a></div>
<div id="wb_Shape34" style="position:absolute;left:0px;top:10px;width:240px;height:70px;z-index:8;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0043.png" id="Shape34" alt="" style="border-width:0;width:240px;height:70px;"/></a></div>
</div>
</div>
<div id="Layer6" style="position:absolute;text-align:center;left:0px;top:4890px;width:103%;height:490px;z-index:75;" title="">
<div id="Layer6_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Bookmark1" style="position:absolute;left:460px;top:10px;width:20px;height:18px;z-index:18;">
<a style="visibility:hidden" name="bookmark1">&nbsp;</a>
</div>
<div id="wb_Shape7" style="position:absolute;left:70px;top:20px;width:300px;height:90px;z-index:19;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0015.png" id="Shape7" alt="" style="border-width:0;width:300px;height:90px;"/></a></div>
<div id="wb_Form1" style="position:absolute;left:40px;top:140px;width:810px;height:330px;z-index:20;">
<form name="Form1" method="post" action="<?php echo basename(__FILE__); ?>" enctype="multipart/form-data" accept-charset="UTF-8" id="Form1" onsubmit="return ValidateForm1(this)">
<input type="text" id="Editbox1" style="position:absolute;left:150px;top:10px;width:383px;height:38px;line-height:38px;z-index:12;" name="имя" value=""/>
<input type="text" id="Editbox2" style="position:absolute;left:150px;top:70px;width:383px;height:48px;line-height:48px;z-index:13;" name="e-mail" value=""/>
<input type="text" id="Editbox3" style="position:absolute;left:240px;top:150px;width:303px;height:38px;line-height:38px;z-index:14;" name="телефон" value=""/>
<input type="text" id="Editbox4" style="position:absolute;left:240px;top:210px;width:303px;height:38px;line-height:38px;z-index:15;" name="название мойки" value=""/>
<input type="text" id="Editbox5" style="position:absolute;left:240px;top:270px;width:303px;height:44px;line-height:44px;z-index:16;" name="адрес мойки" value=""/>
<input type="submit" id="Button1" name="" value="" style="position:absolute;left:610px;top:60px;width:150px;height:131px;z-index:17;"/>
</form>
</div>
</div>
</div>
<div id="Layer8" style="position:absolute;text-align:center;left:0px;top:5900px;width:103%;height:530px;z-index:76;" title="">
<div id="Layer8_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape3" style="position:absolute;left:610px;top:348px;width:220px;height:150px;z-index:21;">
<a href="http://www.moika-77.ru/info/73 " target="_blank"><img src="images/img0010.png" id="Shape3" alt="" style="border-width:0;width:220px;height:150px;"/></a></div>
<div id="wb_Shape11" style="position:absolute;left:100px;top:470px;width:200px;height:50px;z-index:22;">
<a href="#bookmark1"><img src="images/img0018.png" id="Shape11" alt="" style="border-width:0;width:200px;height:50px;"/></a></div>
<div id="wb_Shape15" style="position:absolute;left:890px;top:70px;width:70px;height:40px;z-index:23;">
<a href="http://www.youtube.com/v/Vc6p8JOYNmQ " target="_blank"><img src="images/img0019.png" id="Shape15" alt="" style="border-width:0;width:70px;height:40px;"/></a></div>
<div id="wb_YouTube1" style="position:absolute;left:500px;top:40px;width:420px;height:238px;z-index:24;">
<iframe width="420" height="238" src="http://www.youtube.com/embed/Vc6p8JOYNmQ?rel=1&amp;version=3&amp;autohide=0&amp;theme=dark" frameborder="0"></iframe>
</div>
</div>
</div>
<div id="Layer10" style="position:absolute;text-align:center;left:0px;top:6560px;width:103%;height:520px;z-index:77;" title="">
<div id="Layer10_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
</div>
</div>
<div id="Layer9" style="position:absolute;text-align:center;left:0px;top:7630px;width:103%;height:523px;z-index:78;" title="">
<div id="Layer9_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape10" style="position:absolute;left:370px;top:460px;width:234px;height:60px;z-index:34;">
<a href="#bookmark4"><img src="images/img0024.png" id="Shape10" alt="" style="border-width:0;width:234px;height:60px;"/></a></div>
</div>
</div>
<div id="Layer16" style="position:absolute;text-align:center;left:0px;top:8160px;width:103%;height:520px;z-index:79;" title="">
<div id="Layer16_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape25" style="position:absolute;left:140px;top:140px;width:260px;height:60px;z-index:35;">
<a href="#bookmark4"><img src="images/img0034.png" id="Shape25" alt="" style="border-width:0;width:260px;height:60px;"/></a></div>
</div>
</div>
<div id="Layer17" style="position:absolute;text-align:left;left:0px;top:8690px;width:103%;height:520px;z-index:80;" title="">
<div id="wb_Shape26" style="position:absolute;left:620px;top:30px;width:230px;height:60px;z-index:36;">
<a href="#bookmark4"><img src="images/img0035.png" id="Shape26" alt="" style="border-width:0;width:230px;height:60px;"/></a></div>
</div>
<div id="Layer18" style="position:absolute;text-align:center;left:0px;top:9760px;width:103%;height:520px;z-index:81;" title="">
<div id="Layer18_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Form2" style="position:absolute;left:10px;top:130px;width:850px;height:360px;z-index:42;">
<form name="Form2" method="post" action="<?php echo basename(__FILE__); ?>" enctype="multipart/form-data" accept-charset="UTF-8" id="Form2" onsubmit="return ValidateForm2(this)">
<input type="text" id="Editbox6" style="position:absolute;left:160px;top:20px;width:412px;height:38px;line-height:38px;z-index:37;" name="имя" value=""/>
<input type="text" id="Editbox7" style="position:absolute;left:160px;top:84px;width:412px;height:38px;line-height:38px;z-index:38;" name="e-mail" value=""/>
<input type="text" id="Editbox9" style="position:absolute;left:260px;top:220px;width:317px;height:38px;line-height:38px;z-index:39;" name="пароль подтверждение" value=""/>
<input type="submit" id="Button2" name="" value="Submit" style="position:absolute;left:620px;top:60px;width:150px;height:166px;z-index:40;"/>
<input type="text" id="Editbox8" style="position:absolute;left:160px;top:160px;width:412px;height:38px;line-height:38px;z-index:41;" name="пароль" value=""/>
</form>
</div>
<div id="wb_Bookmark4" style="position:absolute;left:390px;top:10px;width:19px;height:18px;z-index:43;">
<a style="visibility:hidden" name="bookmark4">&nbsp;</a>
</div>
<div id="wb_Shape20" style="position:absolute;left:20px;top:20px;width:320px;height:80px;z-index:44;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0006.png" id="Shape20" alt="" style="border-width:0;width:320px;height:80px;"/></a></div>
</div>
</div>
<div id="Layer20" style="position:absolute;text-align:center;left:0px;top:10490px;width:103%;height:240px;z-index:82;" title="">
<div id="Layer20_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape27" style="position:absolute;left:450px;top:10px;width:247px;height:90px;z-index:52;">
<a href="https://itunes.apple.com/us/app/pul-t-distancionnogo-upravlenia/id946430217?ls=1&mt=8" target="_blank"><img src="images/img0036.png" id="Shape27" alt="" style="border-width:0;width:247px;height:90px;"/></a></div>
<div id="wb_Shape28" style="position:absolute;left:70px;top:10px;width:125px;height:58px;z-index:53;">
<a href="http://www.youtube.com/channel/UC6_OqGCG_UOP0493iCwtomg" target="_blank"><img src="images/img0037.png" id="Shape28" alt="" style="border-width:0;width:125px;height:58px;"/></a></div>
<div id="wb_Shape29" style="position:absolute;left:210px;top:20px;width:50px;height:40px;z-index:54;">
<a href="https://plus.google.com/+%D0%90%D0%B2%D1%82%D0%BE%D0%BC%D0%BE%D0%B9%D0%BA%D0%B8%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D1%8B/posts" target="_blank"><img src="images/img0038.png" id="Shape29" alt="" style="border-width:0;width:50px;height:40px;"/></a></div>
<div id="wb_Shape33" style="position:absolute;left:380px;top:10px;width:60px;height:50px;z-index:55;">
<a href="http://vk.com/moika77" target="_blank"><img src="images/img0042.png" id="Shape33" alt="" style="border-width:0;width:60px;height:50px;"/></a></div>
<div id="wb_Shape32" style="position:absolute;left:320px;top:20px;width:50px;height:40px;z-index:56;">
<a href="https://twitter.com/Moika_77" target="_blank"><img src="images/img0041.png" id="Shape32" alt="" style="border-width:0;width:50px;height:40px;"/></a></div>
<div id="wb_Shape31" style="position:absolute;left:270px;top:20px;width:50px;height:40px;z-index:57;">
<a href="https://www.facebook.com/pages/%D0%9C%D0%BE%D0%B9%D0%BA%D0%B0-77/591788947524160#" target="_blank"><img src="images/img0040.png" id="Shape31" alt="" style="border-width:0;width:50px;height:40px;"/></a></div>
<div id="wb_Shape4" style="position:absolute;left:720px;top:20px;width:240px;height:70px;z-index:58;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0004.png" id="Shape4" alt="" style="border-width:0;width:240px;height:70px;"/></a></div>
</div>
</div>
<div id="Layer21" style="position:absolute;text-align:center;left:0px;top:0px;width:103%;height:527px;z-index:83;" title="">
<div id="Layer21_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Text3" style="position:absolute;left:5px;top:18px;width:246px;height:29px;z-index:60;text-align:left;">
<span style="background-color:#FF0000;color:#FFFFFF;font-family:Arial;font-size:24px;"><strong>www.moika-77.ru</strong></span></div>
<div id="wb_Text5" style="position:absolute;left:250px;top:20px;width:340px;height:29px;z-index:61;text-align:left;">
<span style="background-color:#4169E1;color:#FFFFFF;font-family:Arial;font-size:24px;"><strong>ВЛАДЕЛЬЦАМ АВТОМОЕК</strong></span></div>
<div id="wb_Text6" style="position:absolute;left:583px;top:20px;width:380px;height:29px;z-index:62;text-align:left;">
<span style="background-color:#4169E1;color:#FFFFFF;font-family:Arial;font-size:24px;"><strong>ВЛАДЕЛЬЦАМ АВТОМОБИЛЕЙ</strong></span></div>
<div id="wb_Image6" style="position:absolute;left:290px;top:80px;width:657px;height:40px;z-index:63;">
<img src="images/001.jpg" id="Image6" alt="" style="width:657px;height:40px;"/></div>
<div id="wb_Image7" style="position:absolute;left:460px;top:120px;width:327px;height:39px;z-index:64;">
<img src="images/002.jpg" id="Image7" alt="" style="width:327px;height:39px;"/></div>
<div id="wb_Shape16" style="position:absolute;left:10px;top:0px;width:200px;height:72px;z-index:65;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0007.png" id="Shape16" alt="" style="border-width:0;width:200px;height:72px;"/></a></div>
<div id="wb_Shape35" style="position:absolute;left:240px;top:20px;width:330px;height:40px;z-index:66;">
<a href="#bookmark2"><img src="images/img0008.png" id="Shape35" alt="" style="border-width:0;width:330px;height:40px;"/></a></div>
<div id="wb_Shape36" style="position:absolute;left:580px;top:10px;width:380px;height:40px;z-index:67;">
<a href="#bookmark3"><img src="images/img0011.png" id="Shape36" alt="" style="border-width:0;width:380px;height:40px;"/></a></div>
</div>
</div>
<div id="Layer15" style="position:absolute;text-align:center;left:0px;top:7090px;width:103%;height:527px;z-index:84;" title="">
<div id="Layer15_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Text11" style="position:absolute;left:0px;top:20px;width:246px;height:29px;z-index:68;text-align:left;">
<span style="background-color:#FF0000;color:#FFFFFF;font-family:Arial;font-size:24px;"><strong>www.moika-77.ru</strong></span></div>
<div id="wb_Image10" style="position:absolute;left:430px;top:140px;width:327px;height:39px;z-index:69;">
<img src="images/002.jpg" id="Image10" alt="" style="width:327px;height:39px;"/></div>
<div id="wb_Image11" style="position:absolute;left:310px;top:100px;width:584px;height:39px;z-index:70;">
<img src="images/008.png" id="Image11" alt="" style="width:584px;height:39px;"/></div>
<div id="wb_Image13" style="position:absolute;left:760px;top:10px;width:190px;height:56px;z-index:71;">
<a href="http://moika-77.ru" target="_blank"><img src="images/Logo%20MOYKA%20Moskva.jpg" id="Image13" alt="" style="width:190px;height:56px;"/></a></div>
</div>
</div>
<div id="container">
<div id="wb_Text35">
<span id="wb_uid0"><strong>&#1048;&#1085;&#1085;&#1086;&#1074;&#1072;&#1094;&#1080;&#1086;&#1085;&#1085;&#1099;&#1081; &#1087;&#1088;&#1086;&#1076;&#1091;&#1082;&#1090; &#1087;&#1086; <br/>&#1087;&#1088;&#1080;&#1074;&#1083;&#1077;&#1095;&#1077;&#1085;&#1080;&#1102; &#1082;&#1083;&#1080;&#1077;&#1085;&#1090;&#1086;&#1074;!</strong></span></div>
<div id="wb_Text4">
<span id="wb_uid1">Доступно в AppStore</span></div>
<div id="wb_Image12">
<img src="images/arrow2_24.png" id="Image12" alt=""/></div>
<div id="wb_Shape1">
<a href="#bookmark1"><img src="images/img0002.png" id="Shape1" alt=""/></a></div>
<div id="wb_Image27">
<img src="images/img0003.png" id="Image27" alt=""/></div>
<div id="wb_Image3">
<a href="https://itunes.apple.com/us/app/pul-t-distancionnogo-upravlenia/id946430217?ls=1&mt=8" target="_blank"><img src="images/img0001.jpg" id="Image3" alt=""/></a></div>
<div id="wb_Shape6">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0021.png" id="Shape6" alt=""/></a></div>
<div id="wb_Shape8">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0022.png" id="Shape8" alt=""/></a></div>
<div id="wb_Shape9">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0023.png" id="Shape9" alt=""/></a></div>
<div id="wb_Text34">
<span id="wb_uid2"><strong>&#1042;&#1083;&#1072;&#1076;&#1077;&#1083;&#1100;&#1094;&#1072;&#1084; &#1072;&#1074;&#1090;&#1086;&#1084;&#1086;&#1077;&#1082;!</strong></span></div>
<div id="wb_Bookmark2">
<a id="wb_uid3" name="bookmark2">&nbsp;</a>
</div>
<div id="wb_Shape18">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0029.png" id="Shape18" alt=""/></a></div>
<div id="wb_Shape24">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0033.png" id="Shape24" alt=""/></a></div>
<div id="wb_Shape30">
<a href="https://plus.google.com/+%D0%90%D0%B2%D1%82%D0%BE%D0%BC%D0%BE%D0%B9%D0%BA%D0%B8%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D1%8B/posts" target="_blank"><img src="images/img0039.png" id="Shape30" alt=""/></a></div>
<div id="wb_Text1">
<span id="wb_uid4"><strong>&#1042;&#1083;&#1072;&#1076;&#1077;&#1083;&#1100;&#1094;&#1072;&#1084; &#1072;&#1074;&#1090;&#1086;мобилей!</strong></span></div>
<div id="wb_Bookmark3">
<a id="wb_uid5" name="bookmark3">&nbsp;</a>
</div>
</div>
<div id="Layer2" style="position:absolute;text-align:center;left:0px;top:630px;width:103%;height:470px;z-index:101;" title="">
<div id="Layer2_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape5" style="position:absolute;left:320px;top:100px;width:330px;height:100px;z-index:3;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0009.png" id="Shape5" alt="" style="border-width:0;width:330px;height:100px;"/></a></div>
<div id="wb_Shape19" style="position:absolute;left:370px;top:50px;width:233px;height:72px;z-index:4;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0005.png" id="Shape19" alt="" style="border-width:0;width:233px;height:72px;"/></a></div>
</div>
</div>
<div id="Layer5" style="position:absolute;text-align:center;left:0px;top:3720px;width:103%;height:530px;z-index:102;" title="">
<div id="Layer5_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Image1" style="position:absolute;left:560px;top:450px;width:40px;height:34px;z-index:9;">
<img src="images/arrow2_24.png" id="Image1" alt="" style="width:40px;height:34px;"/></div>
<div id="wb_Shape14" style="position:absolute;left:610px;top:440px;width:295px;height:60px;z-index:10;">
<a href="#bookmark1"><img src="images/img0013.png" id="Shape14" alt="" style="border-width:0;width:295px;height:60px;"/></a></div>
<div id="wb_Image2" style="position:absolute;left:920px;top:450px;width:40px;height:34px;z-index:11;">
<img src="images/img0014.png" id="Image2" alt="" style="width:40px;height:34px;"/></div>
</div>
</div>
<div id="Layer11" style="position:absolute;text-align:center;left:0px;top:1880px;width:103%;height:540px;z-index:103;" title="">
<div id="Layer11_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape21" style="position:absolute;left:300px;top:430px;width:281px;height:95px;z-index:25;">
<a href="https://itunes.apple.com/us/app/pul-t-distancionnogo-upravlenia/id946430217?ls=1&mt=8" target="_blank"><img src="images/img0031.png" id="Shape21" alt="" style="border-width:0;width:281px;height:95px;"/></a></div>
</div>
</div>
<div id="Layer12" style="position:absolute;text-align:center;left:0px;top:2420px;width:103%;height:730px;z-index:104;" title="">
<div id="Layer12_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape22" style="position:absolute;left:270px;top:650px;width:630px;height:70px;z-index:26;">
<a href="http://moika-77.ru" target="_blank"><img src="images/img0032.png" id="Shape22" alt="" style="border-width:0;width:630px;height:70px;"/></a></div>
</div>
</div>
<div id="Layer13" style="position:absolute;text-align:center;left:0px;top:4250px;width:103%;height:650px;z-index:105;" title="">
<div id="Layer13_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Shape12" style="position:absolute;left:290px;top:60px;width:370px;height:50px;z-index:27;">
<a href="#bookmark1"><img src="images/img0020.png" id="Shape12" alt="" style="border-width:0;width:370px;height:50px;"/></a></div>
</div>
</div>
<div id="Layer14" style="position:absolute;text-align:center;left:0px;top:6450px;width:103%;height:10px;z-index:106;" title="">
<div id="Layer14_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
</div>
</div>
<div id="Layer19" style="position:absolute;text-align:center;left:0px;top:10280px;width:103%;height:210px;z-index:107;" title="">
<div id="Layer19_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Text2" style="position:absolute;left:180px;top:40px;width:605px;height:27px;text-align:center;z-index:50;">
<span style="color:#808080;font-family:Arial;font-size:24px;">Расскажите друзьям о нашем сервисе</span></div>
<div id="Html2" style="position:absolute;left:330px;top:90px;width:310px;height:98px;z-index:51">

<script type="text/javascript">(function(w,doc) {
if (!w.__utlWdgt ) {
    w.__utlWdgt = true;
    var d = doc, s = d.createElement('script'), g = 'getElementsByTagName';
    s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
    s.src = ('https:' == w.location.protocol ? 'https' : 'http')  + '://w.uptolike.com/widgets/v1/uptolike.js';
    var h=d[g]('body')[0];
    h.appendChild(s);
}})(window,document);
</script>
<div data-share-size="30" data-like-text-enable="false" data-background-alpha="0.0" data-pid="1334461" data-mode="share" data-background-color="#ffffff" data-hover-effect="scale" data-share-shape="round-rectangle" data-share-counter-size="14" data-icon-color="#ffffff" data-text-color="#000000" data-buttons-color="#ffffff" data-counter-background-color="#ffffff" data-share-counter-type="disable" data-orientation="horizontal" data-following-enable="false" data-sn-ids="fb.vk.tw.ok.gp.mr.lj." data-selection-enable="true" data-exclude-show-more="false" data-share-style="12" data-counter-background-alpha="1.0" data-top-button="false" class="uptolike-buttons"></div></div>
</div>
</div>
<div id="Layer1" style="position:absolute;text-align:center;left:0px;top:9220px;width:103%;height:540px;z-index:108;" title="">
<div id="Layer1_Container" style="width:1010px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_YouTube3" style="position:absolute;left:170px;top:100px;width:660px;height:390px;z-index:59;">
<iframe width="660" height="390" src="http://www.youtube.com/embed/B3Wp_MJBwhU?rel=1&amp;version=3&amp;autohide=0&amp;theme=dark" frameborder="0"></iframe>
</div>
</div>
</div>
</body>
</html>