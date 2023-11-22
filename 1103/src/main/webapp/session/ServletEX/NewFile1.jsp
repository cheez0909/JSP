<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../5/sketchy/bootstrap.css" style="user-select: auto;">
<link rel="stylesheet" href="../_vendor/bootstrap-icons/font/bootstrap-icons.min.css" style="user-select: auto;">
<link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css" style="user-select: auto;">
<link rel="stylesheet" href="../_assets/css/custom.min.css" style="user-select: auto;">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form style="user-select: auto;">
  <fieldset style="user-select: auto;">
    <legend style="user-select: auto;">Legend</legend>
    <div class="form-group row" style="user-select: auto;">
      <label for="staticEmail" class="col-sm-2 col-form-label" style="user-select: auto;">Email</label>
      <div class="col-sm-10" style="user-select: auto;">
        <input type="text" readonly="" class="form-control-plaintext" id="staticEmail" value="email@example.com" style="user-select: auto;">
      </div>
    </div>
    <div class="form-group" style="user-select: auto;">
      <label for="exampleInputEmail1" class="form-label mt-4" style="user-select: auto;">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" style="user-select: auto;">
      <small id="emailHelp" class="form-text text-muted" style="user-select: auto;">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group" style="user-select: auto;">
      <label for="exampleInputPassword1" class="form-label mt-4" style="user-select: auto;">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" autocomplete="off" style="user-select: auto;">
    </div>
    <div class="form-group" style="user-select: auto;">
      <label for="exampleSelect1" class="form-label mt-4" style="user-select: auto;">Example select</label>
      <select class="form-control" id="exampleSelect1" style="user-select: auto;">
        <option style="user-select: auto;">1</option>
        <option style="user-select: auto;">2</option>
        <option style="user-select: auto;">3</option>
        <option style="user-select: auto;">4</option>
        <option style="user-select: auto;">5</option>
      </select>
    </div>
    <div class="form-group" style="user-select: auto;">
      <label for="exampleSelect1" class="form-label mt-4" style="user-select: auto;">Example disabled select</label>
      <select class="form-select" id="exampleDisabledSelect1" disabled="" style="user-select: auto;">
        <option style="user-select: auto;">1</option>
        <option style="user-select: auto;">2</option>
        <option style="user-select: auto;">3</option>
        <option style="user-select: auto;">4</option>
        <option style="user-select: auto;">5</option>
      </select>
    </div>
    <div class="form-group" style="user-select: auto;">
      <label for="exampleSelect2" class="form-label mt-4" style="user-select: auto;">Example multiple select</label>
      <select multiple="" class="form-select" id="exampleSelect2" style="user-select: auto;">
        <option style="user-select: auto;">1</option>
        <option style="user-select: auto;">2</option>
        <option style="user-select: auto;">3</option>
        <option style="user-select: auto;">4</option>
        <option style="user-select: auto;">5</option>
      </select>
    </div>
    <div class="form-group" style="user-select: auto;">
      <label for="exampleTextarea" class="form-label mt-4" style="user-select: auto;">Example textarea</label>
      <textarea class="form-control" id="exampleTextarea" rows="3" style="user-select: auto;"></textarea>
    </div>
    <div class="form-group" style="user-select: auto;">
      <label for="formFile" class="form-label mt-4" style="user-select: auto;">Default file input example</label>
      <input class="form-control" type="file" id="formFile" style="user-select: auto;">
    </div>
    <fieldset class="form-group" style="user-select: auto;">
      <legend class="mt-4" style="user-select: auto;">Radio buttons</legend>
      <div class="form-check" style="user-select: auto;">
        <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="" style="user-select: auto;">
        <label class="form-check-label" for="optionsRadios1" style="user-select: auto;">
          Option one is this and that—be sure to include why it's great
        </label>
      </div>
      <div class="form-check" style="user-select: auto;">
        <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2" style="user-select: auto;">
        <label class="form-check-label" for="optionsRadios2" style="user-select: auto;">
          Option two can be something else and selecting it will deselect option one
        </label>
      </div>
      <div class="form-check disabled" style="user-select: auto;">
        <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled="" style="user-select: auto;">
        <label class="form-check-label" for="optionsRadios3" style="user-select: auto;">
          Option three is disabled
        </label>
      </div>
    </fieldset>
    <fieldset class="form-group" style="user-select: auto;">
      <legend class="mt-4" style="user-select: auto;">Checkboxes</legend>
      <div class="form-check" style="user-select: auto;">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" style="user-select: auto;">
        <label class="form-check-label" for="flexCheckDefault" style="user-select: auto;">
          Default checkbox
        </label>
      </div>
      <div class="form-check" style="user-select: auto;">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked="" style="user-select: auto;">
        <label class="form-check-label" for="flexCheckChecked" style="user-select: auto;">
          Checked checkbox
        </label>
      </div>
    </fieldset>
    <fieldset class="form-group" style="user-select: auto;">
      <legend class="mt-4" style="user-select: auto;">Switches</legend>
      <div class="form-check form-switch" style="user-select: auto;">
        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" style="user-select: auto;">
        <label class="form-check-label" for="flexSwitchCheckDefault" style="user-select: auto;">Default switch checkbox input</label>
      </div>
      <div class="form-check form-switch" style="user-select: auto;">
        <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="" style="user-select: auto;">
        <label class="form-check-label" for="flexSwitchCheckChecked" style="user-select: auto;">Checked switch checkbox input</label>
      </div>
    </fieldset>
    <fieldset class="form-group" style="user-select: auto;">
      <legend class="mt-4" style="user-select: auto;">Ranges</legend>
        <label for="customRange1" class="form-label" style="user-select: auto;">Example range</label>
        <input type="range" class="form-range" id="customRange1" style="user-select: auto;">
        <label for="disabledRange" class="form-label" style="user-select: auto;">Disabled range</label>
        <input type="range" class="form-range" id="disabledRange" disabled="" style="user-select: auto;">
        <label for="customRange3" class="form-label" style="user-select: auto;">Example range</label>
        <input type="range" class="form-range" min="0" max="5" step="0.5" id="customRange3" style="user-select: auto;">
    </fieldset>
    <button type="submit" class="btn btn-primary" style="user-select: auto;">Submit</button>
  </fieldset>
</form>
</body>
</html>