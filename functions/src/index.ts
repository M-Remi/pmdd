import {onCall} from "firebase-functions/v2/https";
import {defineSecret} from "firebase-functions/params";
import {Resend} from "resend";

const resendKey = defineSecret("RESEND_API_KEY");

export const sendWelcomeEmail = onCall(
  {secrets: [resendKey]},
  async (request) => {
    const resend = new Resend(resendKey.value());

    const email = request.data.email;
    const name1 = request.data.name;
    const name = name1.charAt(0).toUpperCase() + name1.slice(1);


    const result = await resend.emails.send({
      from: "PMDD <welcome@pmdd.uk>",
      to: email,
      subject: "Welcome to PMDD 🌸",
      html: `
  <div style="font-family: Arial, sans-serif; padding: 20px;">
    <img
      src="https://firebasestorage.googleapis.com/v0/b/pmdd-dff13.firebasestorage.app/o/woman.png?alt=media&token=81f36fb4-f37d-4f8f-9e9d-fb30c2fcaedf"
      alt="PMDD Logo"
      width="120"
    />

    <h1>Welcome to PMDD 🌸</h1>

    <p>Hello <strong>${name}</strong>,</p>

    <p>Thank you for joining PMDD.</p>

    <p>We are delighted to support your wellness journey.</p>

    <p>Your account has been created successfully.</p>

    <p>The PMDD Team</p>
  </div>
`,
    });


    return {
      success: true,
      result,
    };
  }
);

export const sendEmail = onCall(
  {secrets: [resendKey]},
  async (request) => {
    const resend = new Resend(resendKey.value());

    const email = request.data.email;
    const subject = request.data.subject;
    const content = request.data.content;

    const result = await resend.emails.send({
      from: "PMDD <welcome@pmdd.uk>",
      to: email,
      subject: subject,
      html: content,
    });

    return {
      success: true,
      result,
    };
  }
);

