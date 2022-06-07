<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<% if (session.getAttribute("status") != null && (session.getAttribute("status").equals("member") ||
        session.getAttribute("status").equals("admin"))) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>How to take care of a dog</title>
</head>
<body bgcolor="D6AC91" style="font-family: Calibri; margin-left: 200px; margin-right: 200px;">
<jsp:include page="Menu.jsp"></jsp:include>
<h1>How to take care of your dog</h1>
<br>
<p>
    Great, so you have followed the guide about <a href="GetADog.jsp">how to get a dog</a>, and now you're wondering how
    to make sure your dog is happy & healthy. Here are a few tips:
</p>

<h2>
    VACCINATE YOUR DOG!
</h2>
<p>
    Vaccinating your dog is crucial if you want it to be healthy -  many dangerous illnesses are prevented by vaccines.
    Thus, vaccines will protect your dog, but also you and other people, since pet diseases can spread to people. Once
    you get your dog, you should talk to a vet about vaccinating it as soon as possible.
</p>
<h2>
    Consider neutering it
</h2>
<p>
    This is, of course, subjective, and up to personal preference. However, you might not want to get to a situation
    where you suddenly have several additional puppies, since both caring for them and giving them a way can be a hassle.
    Neutering your dog is the best way to prevent that, so it is worth considering.
</p>
<h2>Make sure it has a comfortable bed</h2>
<p>
    It is absolutely worth it to invest in a nice bed that your dog will be comfortable in. Just like you want a good
    bed, your dog would want one too. It should not be too large, and it definitely should not be too small. <br>
    You can also give your dog a blanket and even a small pillow - they will appreciate it!
</p>

<h2>
    Make sure it always has good food and water
</h2>
<p>
    Simply getting any dog food from your local pet accessories store is not ideal. Different dogs may require different
    kinds of food - depending on their breed and allergies. Different dogs would also need different amounts of food. It
    is recommended to consult your vet about what and how much you should your dog. <br>
    In addition, also make sure it has fresh water - you don't want your dog to get thirsty!
</p>
<h2>
    Take your dog out several times a day
</h2>
<p>
    Most dogs need to go out three times a day. However, some dogs may need a little less or a little more time outside.
    Remember to take walks with your dog; after a while, you'll be able to read it and understand when it wants to go out.
</p>
<h2>
    Be patient
</h2>
<p>
    Once you get your dog, it is probably going to pee and poop in house quite a lot. It's not fun to clean after it
    all the time, but after a while it will become a rare occasion. Be patient, and remember not to get mad at your dog
    if it happens to do its business in the house even years after living with you - can you really blame it for having to pee?
</p>
<h2>
    Treats go a long way
</h2>
<p>
    Dogs love treats, just like humans love snacks. Every once in a while, give your dog a treat - they've been a good
    boy/girl and they deserve a delicious snack. Treats can also be a massive help when you try to train them - trust me
    when I say that if a dog wants a treat, they'll happily sit or come to you in order to get it.
</p>
</body>
</html>
<%
    } else {
        out.print("<font face=\"calibri\"><center><b><h1> <a href=\"Login.jsp\">Log in</a> in order to see this page</h1></b></center></font>");
    }
%>