
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];  // what is this for?
	memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 3d 32 00 00       	call   103269 <memset>

    cons_init();                // init the console
  10002c:	e8 47 15 00 00       	call   101578 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 00 34 10 00 	movl   $0x103400,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 1c 34 10 00 	movl   $0x10341c,(%esp)
  100046:	e8 cc 02 00 00       	call   100317 <cprintf>

    print_kerninfo();
  10004b:	e8 fb 07 00 00       	call   10084b <print_kerninfo>

    grade_backtrace();
  100050:	e8 8b 00 00 00       	call   1000e0 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 55 28 00 00       	call   1028af <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 5c 16 00 00       	call   1016bb <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 ae 17 00 00       	call   101812 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 02 0d 00 00       	call   100d6b <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 bb 15 00 00       	call   101629 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 62 01 00 00       	call   1001d5 <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 06 0c 00 00       	call   100c9d <mon_backtrace>
}
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	55                   	push   %ebp
  10009a:	89 e5                	mov    %esp,%ebp
  10009c:	53                   	push   %ebx
  10009d:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a0:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  1000a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a6:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ac:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000b0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000b4:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b8:	89 04 24             	mov    %eax,(%esp)
  1000bb:	e8 b5 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c0:	83 c4 14             	add    $0x14,%esp
  1000c3:	5b                   	pop    %ebx
  1000c4:	5d                   	pop    %ebp
  1000c5:	c3                   	ret    

001000c6 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c6:	55                   	push   %ebp
  1000c7:	89 e5                	mov    %esp,%ebp
  1000c9:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000cc:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d6:	89 04 24             	mov    %eax,(%esp)
  1000d9:	e8 bb ff ff ff       	call   100099 <grade_backtrace1>
}
  1000de:	c9                   	leave  
  1000df:	c3                   	ret    

001000e0 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e0:	55                   	push   %ebp
  1000e1:	89 e5                	mov    %esp,%ebp
  1000e3:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e6:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000eb:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f2:	ff 
  1000f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000fe:	e8 c3 ff ff ff       	call   1000c6 <grade_backtrace0>
}
  100103:	c9                   	leave  
  100104:	c3                   	ret    

00100105 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100105:	55                   	push   %ebp
  100106:	89 e5                	mov    %esp,%ebp
  100108:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010b:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10010e:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100111:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100114:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100117:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011b:	0f b7 c0             	movzwl %ax,%eax
  10011e:	83 e0 03             	and    $0x3,%eax
  100121:	89 c2                	mov    %eax,%edx
  100123:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100128:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100130:	c7 04 24 21 34 10 00 	movl   $0x103421,(%esp)
  100137:	e8 db 01 00 00       	call   100317 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100140:	0f b7 d0             	movzwl %ax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 2f 34 10 00 	movl   $0x10342f,(%esp)
  100157:	e8 bb 01 00 00       	call   100317 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	0f b7 d0             	movzwl %ax,%edx
  100163:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100168:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100170:	c7 04 24 3d 34 10 00 	movl   $0x10343d,(%esp)
  100177:	e8 9b 01 00 00       	call   100317 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100180:	0f b7 d0             	movzwl %ax,%edx
  100183:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100188:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100190:	c7 04 24 4b 34 10 00 	movl   $0x10344b,(%esp)
  100197:	e8 7b 01 00 00       	call   100317 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019c:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001a0:	0f b7 d0             	movzwl %ax,%edx
  1001a3:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a8:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001ac:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b0:	c7 04 24 59 34 10 00 	movl   $0x103459,(%esp)
  1001b7:	e8 5b 01 00 00       	call   100317 <cprintf>
    round ++;
  1001bc:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001c1:	83 c0 01             	add    $0x1,%eax
  1001c4:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c9:	c9                   	leave  
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO

}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001d3:	5d                   	pop    %ebp
  1001d4:	c3                   	ret    

001001d5 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d5:	55                   	push   %ebp
  1001d6:	89 e5                	mov    %esp,%ebp
  1001d8:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001db:	e8 25 ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e0:	c7 04 24 68 34 10 00 	movl   $0x103468,(%esp)
  1001e7:	e8 2b 01 00 00       	call   100317 <cprintf>
    lab1_switch_to_user();
  1001ec:	e8 da ff ff ff       	call   1001cb <lab1_switch_to_user>
    lab1_print_cur_status();
  1001f1:	e8 0f ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f6:	c7 04 24 88 34 10 00 	movl   $0x103488,(%esp)
  1001fd:	e8 15 01 00 00       	call   100317 <cprintf>
    lab1_switch_to_kernel();
  100202:	e8 c9 ff ff ff       	call   1001d0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100207:	e8 f9 fe ff ff       	call   100105 <lab1_print_cur_status>
}
  10020c:	c9                   	leave  
  10020d:	c3                   	ret    

0010020e <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10020e:	55                   	push   %ebp
  10020f:	89 e5                	mov    %esp,%ebp
  100211:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100214:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100218:	74 13                	je     10022d <readline+0x1f>
        cprintf("%s", prompt);
  10021a:	8b 45 08             	mov    0x8(%ebp),%eax
  10021d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100221:	c7 04 24 a7 34 10 00 	movl   $0x1034a7,(%esp)
  100228:	e8 ea 00 00 00       	call   100317 <cprintf>
    }
    int i = 0, c;
  10022d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100234:	e8 66 01 00 00       	call   10039f <getchar>
  100239:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10023c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100240:	79 07                	jns    100249 <readline+0x3b>
            return NULL;
  100242:	b8 00 00 00 00       	mov    $0x0,%eax
  100247:	eb 79                	jmp    1002c2 <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100249:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10024d:	7e 28                	jle    100277 <readline+0x69>
  10024f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100256:	7f 1f                	jg     100277 <readline+0x69>
            cputchar(c);
  100258:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10025b:	89 04 24             	mov    %eax,(%esp)
  10025e:	e8 da 00 00 00       	call   10033d <cputchar>
            buf[i ++] = c;
  100263:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100266:	8d 50 01             	lea    0x1(%eax),%edx
  100269:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10026c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026f:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100275:	eb 46                	jmp    1002bd <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100277:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10027b:	75 17                	jne    100294 <readline+0x86>
  10027d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100281:	7e 11                	jle    100294 <readline+0x86>
            cputchar(c);
  100283:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100286:	89 04 24             	mov    %eax,(%esp)
  100289:	e8 af 00 00 00       	call   10033d <cputchar>
            i --;
  10028e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100292:	eb 29                	jmp    1002bd <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  100294:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100298:	74 06                	je     1002a0 <readline+0x92>
  10029a:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10029e:	75 1d                	jne    1002bd <readline+0xaf>
            cputchar(c);
  1002a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002a3:	89 04 24             	mov    %eax,(%esp)
  1002a6:	e8 92 00 00 00       	call   10033d <cputchar>
            buf[i] = '\0';
  1002ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002ae:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002b3:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b6:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002bb:	eb 05                	jmp    1002c2 <readline+0xb4>
        }
    }
  1002bd:	e9 72 ff ff ff       	jmp    100234 <readline+0x26>
}
  1002c2:	c9                   	leave  
  1002c3:	c3                   	ret    

001002c4 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002c4:	55                   	push   %ebp
  1002c5:	89 e5                	mov    %esp,%ebp
  1002c7:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1002cd:	89 04 24             	mov    %eax,(%esp)
  1002d0:	e8 cf 12 00 00       	call   1015a4 <cons_putc>
    (*cnt) ++;
  1002d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d8:	8b 00                	mov    (%eax),%eax
  1002da:	8d 50 01             	lea    0x1(%eax),%edx
  1002dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e0:	89 10                	mov    %edx,(%eax)
}
  1002e2:	c9                   	leave  
  1002e3:	c3                   	ret    

001002e4 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002e4:	55                   	push   %ebp
  1002e5:	89 e5                	mov    %esp,%ebp
  1002e7:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002f4:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002ff:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100302:	89 44 24 04          	mov    %eax,0x4(%esp)
  100306:	c7 04 24 c4 02 10 00 	movl   $0x1002c4,(%esp)
  10030d:	e8 70 27 00 00       	call   102a82 <vprintfmt>
    return cnt;
  100312:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100315:	c9                   	leave  
  100316:	c3                   	ret    

00100317 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100317:	55                   	push   %ebp
  100318:	89 e5                	mov    %esp,%ebp
  10031a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10031d:	8d 45 0c             	lea    0xc(%ebp),%eax
  100320:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100323:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100326:	89 44 24 04          	mov    %eax,0x4(%esp)
  10032a:	8b 45 08             	mov    0x8(%ebp),%eax
  10032d:	89 04 24             	mov    %eax,(%esp)
  100330:	e8 af ff ff ff       	call   1002e4 <vcprintf>
  100335:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100338:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10033b:	c9                   	leave  
  10033c:	c3                   	ret    

0010033d <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10033d:	55                   	push   %ebp
  10033e:	89 e5                	mov    %esp,%ebp
  100340:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100343:	8b 45 08             	mov    0x8(%ebp),%eax
  100346:	89 04 24             	mov    %eax,(%esp)
  100349:	e8 56 12 00 00       	call   1015a4 <cons_putc>
}
  10034e:	c9                   	leave  
  10034f:	c3                   	ret    

00100350 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100350:	55                   	push   %ebp
  100351:	89 e5                	mov    %esp,%ebp
  100353:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100356:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10035d:	eb 13                	jmp    100372 <cputs+0x22>
        cputch(c, &cnt);
  10035f:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100363:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100366:	89 54 24 04          	mov    %edx,0x4(%esp)
  10036a:	89 04 24             	mov    %eax,(%esp)
  10036d:	e8 52 ff ff ff       	call   1002c4 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100372:	8b 45 08             	mov    0x8(%ebp),%eax
  100375:	8d 50 01             	lea    0x1(%eax),%edx
  100378:	89 55 08             	mov    %edx,0x8(%ebp)
  10037b:	0f b6 00             	movzbl (%eax),%eax
  10037e:	88 45 f7             	mov    %al,-0x9(%ebp)
  100381:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100385:	75 d8                	jne    10035f <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100387:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10038a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10038e:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100395:	e8 2a ff ff ff       	call   1002c4 <cputch>
    return cnt;
  10039a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  10039d:	c9                   	leave  
  10039e:	c3                   	ret    

0010039f <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039f:	55                   	push   %ebp
  1003a0:	89 e5                	mov    %esp,%ebp
  1003a2:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a5:	e8 23 12 00 00       	call   1015cd <cons_getc>
  1003aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003b1:	74 f2                	je     1003a5 <getchar+0x6>
        /* do nothing */;
    return c;
  1003b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b6:	c9                   	leave  
  1003b7:	c3                   	ret    

001003b8 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b8:	55                   	push   %ebp
  1003b9:	89 e5                	mov    %esp,%ebp
  1003bb:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003c1:	8b 00                	mov    (%eax),%eax
  1003c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c6:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c9:	8b 00                	mov    (%eax),%eax
  1003cb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d5:	e9 d2 00 00 00       	jmp    1004ac <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003da:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003dd:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003e0:	01 d0                	add    %edx,%eax
  1003e2:	89 c2                	mov    %eax,%edx
  1003e4:	c1 ea 1f             	shr    $0x1f,%edx
  1003e7:	01 d0                	add    %edx,%eax
  1003e9:	d1 f8                	sar    %eax
  1003eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003f1:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f4:	eb 04                	jmp    1003fa <stab_binsearch+0x42>
            m --;
  1003f6:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100400:	7c 1f                	jl     100421 <stab_binsearch+0x69>
  100402:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100405:	89 d0                	mov    %edx,%eax
  100407:	01 c0                	add    %eax,%eax
  100409:	01 d0                	add    %edx,%eax
  10040b:	c1 e0 02             	shl    $0x2,%eax
  10040e:	89 c2                	mov    %eax,%edx
  100410:	8b 45 08             	mov    0x8(%ebp),%eax
  100413:	01 d0                	add    %edx,%eax
  100415:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100419:	0f b6 c0             	movzbl %al,%eax
  10041c:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041f:	75 d5                	jne    1003f6 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  100421:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100424:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100427:	7d 0b                	jge    100434 <stab_binsearch+0x7c>
            l = true_m + 1;
  100429:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10042c:	83 c0 01             	add    $0x1,%eax
  10042f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100432:	eb 78                	jmp    1004ac <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  100434:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10043b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10043e:	89 d0                	mov    %edx,%eax
  100440:	01 c0                	add    %eax,%eax
  100442:	01 d0                	add    %edx,%eax
  100444:	c1 e0 02             	shl    $0x2,%eax
  100447:	89 c2                	mov    %eax,%edx
  100449:	8b 45 08             	mov    0x8(%ebp),%eax
  10044c:	01 d0                	add    %edx,%eax
  10044e:	8b 40 08             	mov    0x8(%eax),%eax
  100451:	3b 45 18             	cmp    0x18(%ebp),%eax
  100454:	73 13                	jae    100469 <stab_binsearch+0xb1>
            *region_left = m;
  100456:	8b 45 0c             	mov    0xc(%ebp),%eax
  100459:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10045c:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10045e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100461:	83 c0 01             	add    $0x1,%eax
  100464:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100467:	eb 43                	jmp    1004ac <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100469:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10046c:	89 d0                	mov    %edx,%eax
  10046e:	01 c0                	add    %eax,%eax
  100470:	01 d0                	add    %edx,%eax
  100472:	c1 e0 02             	shl    $0x2,%eax
  100475:	89 c2                	mov    %eax,%edx
  100477:	8b 45 08             	mov    0x8(%ebp),%eax
  10047a:	01 d0                	add    %edx,%eax
  10047c:	8b 40 08             	mov    0x8(%eax),%eax
  10047f:	3b 45 18             	cmp    0x18(%ebp),%eax
  100482:	76 16                	jbe    10049a <stab_binsearch+0xe2>
            *region_right = m - 1;
  100484:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100487:	8d 50 ff             	lea    -0x1(%eax),%edx
  10048a:	8b 45 10             	mov    0x10(%ebp),%eax
  10048d:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100492:	83 e8 01             	sub    $0x1,%eax
  100495:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100498:	eb 12                	jmp    1004ac <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10049a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004a0:	89 10                	mov    %edx,(%eax)
            l = m;
  1004a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a8:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004b2:	0f 8e 22 ff ff ff    	jle    1003da <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004bc:	75 0f                	jne    1004cd <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c1:	8b 00                	mov    (%eax),%eax
  1004c3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c6:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c9:	89 10                	mov    %edx,(%eax)
  1004cb:	eb 3f                	jmp    10050c <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004cd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d0:	8b 00                	mov    (%eax),%eax
  1004d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d5:	eb 04                	jmp    1004db <stab_binsearch+0x123>
  1004d7:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004de:	8b 00                	mov    (%eax),%eax
  1004e0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004e3:	7d 1f                	jge    100504 <stab_binsearch+0x14c>
  1004e5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e8:	89 d0                	mov    %edx,%eax
  1004ea:	01 c0                	add    %eax,%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	c1 e0 02             	shl    $0x2,%eax
  1004f1:	89 c2                	mov    %eax,%edx
  1004f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f6:	01 d0                	add    %edx,%eax
  1004f8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004fc:	0f b6 c0             	movzbl %al,%eax
  1004ff:	3b 45 14             	cmp    0x14(%ebp),%eax
  100502:	75 d3                	jne    1004d7 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  100504:	8b 45 0c             	mov    0xc(%ebp),%eax
  100507:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10050a:	89 10                	mov    %edx,(%eax)
    }
}
  10050c:	c9                   	leave  
  10050d:	c3                   	ret    

0010050e <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10050e:	55                   	push   %ebp
  10050f:	89 e5                	mov    %esp,%ebp
  100511:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100514:	8b 45 0c             	mov    0xc(%ebp),%eax
  100517:	c7 00 ac 34 10 00    	movl   $0x1034ac,(%eax)
    info->eip_line = 0;
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100527:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052a:	c7 40 08 ac 34 10 00 	movl   $0x1034ac,0x8(%eax)
    info->eip_fn_namelen = 9;
  100531:	8b 45 0c             	mov    0xc(%ebp),%eax
  100534:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10053b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10053e:	8b 55 08             	mov    0x8(%ebp),%edx
  100541:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100544:	8b 45 0c             	mov    0xc(%ebp),%eax
  100547:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10054e:	c7 45 f4 0c 3d 10 00 	movl   $0x103d0c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100555:	c7 45 f0 4c b4 10 00 	movl   $0x10b44c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10055c:	c7 45 ec 4d b4 10 00 	movl   $0x10b44d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100563:	c7 45 e8 38 d4 10 00 	movl   $0x10d438,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10056a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10056d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100570:	76 0d                	jbe    10057f <debuginfo_eip+0x71>
  100572:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100575:	83 e8 01             	sub    $0x1,%eax
  100578:	0f b6 00             	movzbl (%eax),%eax
  10057b:	84 c0                	test   %al,%al
  10057d:	74 0a                	je     100589 <debuginfo_eip+0x7b>
        return -1;
  10057f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100584:	e9 c0 02 00 00       	jmp    100849 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100589:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100590:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100593:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100596:	29 c2                	sub    %eax,%edx
  100598:	89 d0                	mov    %edx,%eax
  10059a:	c1 f8 02             	sar    $0x2,%eax
  10059d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005a3:	83 e8 01             	sub    $0x1,%eax
  1005a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ac:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005b0:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b7:	00 
  1005b8:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005bb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005bf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c9:	89 04 24             	mov    %eax,(%esp)
  1005cc:	e8 e7 fd ff ff       	call   1003b8 <stab_binsearch>
    if (lfile == 0)
  1005d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005d4:	85 c0                	test   %eax,%eax
  1005d6:	75 0a                	jne    1005e2 <debuginfo_eip+0xd4>
        return -1;
  1005d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005dd:	e9 67 02 00 00       	jmp    100849 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005eb:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f5:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005fc:	00 
  1005fd:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100600:	89 44 24 08          	mov    %eax,0x8(%esp)
  100604:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100607:	89 44 24 04          	mov    %eax,0x4(%esp)
  10060b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10060e:	89 04 24             	mov    %eax,(%esp)
  100611:	e8 a2 fd ff ff       	call   1003b8 <stab_binsearch>

    if (lfun <= rfun) {
  100616:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100619:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10061c:	39 c2                	cmp    %eax,%edx
  10061e:	7f 7c                	jg     10069c <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  100620:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100623:	89 c2                	mov    %eax,%edx
  100625:	89 d0                	mov    %edx,%eax
  100627:	01 c0                	add    %eax,%eax
  100629:	01 d0                	add    %edx,%eax
  10062b:	c1 e0 02             	shl    $0x2,%eax
  10062e:	89 c2                	mov    %eax,%edx
  100630:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100633:	01 d0                	add    %edx,%eax
  100635:	8b 10                	mov    (%eax),%edx
  100637:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10063a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10063d:	29 c1                	sub    %eax,%ecx
  10063f:	89 c8                	mov    %ecx,%eax
  100641:	39 c2                	cmp    %eax,%edx
  100643:	73 22                	jae    100667 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100645:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100648:	89 c2                	mov    %eax,%edx
  10064a:	89 d0                	mov    %edx,%eax
  10064c:	01 c0                	add    %eax,%eax
  10064e:	01 d0                	add    %edx,%eax
  100650:	c1 e0 02             	shl    $0x2,%eax
  100653:	89 c2                	mov    %eax,%edx
  100655:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100658:	01 d0                	add    %edx,%eax
  10065a:	8b 10                	mov    (%eax),%edx
  10065c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065f:	01 c2                	add    %eax,%edx
  100661:	8b 45 0c             	mov    0xc(%ebp),%eax
  100664:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100667:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10066a:	89 c2                	mov    %eax,%edx
  10066c:	89 d0                	mov    %edx,%eax
  10066e:	01 c0                	add    %eax,%eax
  100670:	01 d0                	add    %edx,%eax
  100672:	c1 e0 02             	shl    $0x2,%eax
  100675:	89 c2                	mov    %eax,%edx
  100677:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10067a:	01 d0                	add    %edx,%eax
  10067c:	8b 50 08             	mov    0x8(%eax),%edx
  10067f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100682:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100685:	8b 45 0c             	mov    0xc(%ebp),%eax
  100688:	8b 40 10             	mov    0x10(%eax),%eax
  10068b:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10068e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100691:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100694:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100697:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10069a:	eb 15                	jmp    1006b1 <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10069c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069f:	8b 55 08             	mov    0x8(%ebp),%edx
  1006a2:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b4:	8b 40 08             	mov    0x8(%eax),%eax
  1006b7:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006be:	00 
  1006bf:	89 04 24             	mov    %eax,(%esp)
  1006c2:	e8 16 2a 00 00       	call   1030dd <strfind>
  1006c7:	89 c2                	mov    %eax,%edx
  1006c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cc:	8b 40 08             	mov    0x8(%eax),%eax
  1006cf:	29 c2                	sub    %eax,%edx
  1006d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006d4:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1006da:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006de:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e5:	00 
  1006e6:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ed:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006f0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f7:	89 04 24             	mov    %eax,(%esp)
  1006fa:	e8 b9 fc ff ff       	call   1003b8 <stab_binsearch>
    if (lline <= rline) {
  1006ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100702:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100705:	39 c2                	cmp    %eax,%edx
  100707:	7f 24                	jg     10072d <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100709:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10070c:	89 c2                	mov    %eax,%edx
  10070e:	89 d0                	mov    %edx,%eax
  100710:	01 c0                	add    %eax,%eax
  100712:	01 d0                	add    %edx,%eax
  100714:	c1 e0 02             	shl    $0x2,%eax
  100717:	89 c2                	mov    %eax,%edx
  100719:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071c:	01 d0                	add    %edx,%eax
  10071e:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100722:	0f b7 d0             	movzwl %ax,%edx
  100725:	8b 45 0c             	mov    0xc(%ebp),%eax
  100728:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10072b:	eb 13                	jmp    100740 <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  10072d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100732:	e9 12 01 00 00       	jmp    100849 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100737:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10073a:	83 e8 01             	sub    $0x1,%eax
  10073d:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100740:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100743:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100746:	39 c2                	cmp    %eax,%edx
  100748:	7c 56                	jl     1007a0 <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  10074a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074d:	89 c2                	mov    %eax,%edx
  10074f:	89 d0                	mov    %edx,%eax
  100751:	01 c0                	add    %eax,%eax
  100753:	01 d0                	add    %edx,%eax
  100755:	c1 e0 02             	shl    $0x2,%eax
  100758:	89 c2                	mov    %eax,%edx
  10075a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075d:	01 d0                	add    %edx,%eax
  10075f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100763:	3c 84                	cmp    $0x84,%al
  100765:	74 39                	je     1007a0 <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100767:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10076a:	89 c2                	mov    %eax,%edx
  10076c:	89 d0                	mov    %edx,%eax
  10076e:	01 c0                	add    %eax,%eax
  100770:	01 d0                	add    %edx,%eax
  100772:	c1 e0 02             	shl    $0x2,%eax
  100775:	89 c2                	mov    %eax,%edx
  100777:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10077a:	01 d0                	add    %edx,%eax
  10077c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100780:	3c 64                	cmp    $0x64,%al
  100782:	75 b3                	jne    100737 <debuginfo_eip+0x229>
  100784:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100787:	89 c2                	mov    %eax,%edx
  100789:	89 d0                	mov    %edx,%eax
  10078b:	01 c0                	add    %eax,%eax
  10078d:	01 d0                	add    %edx,%eax
  10078f:	c1 e0 02             	shl    $0x2,%eax
  100792:	89 c2                	mov    %eax,%edx
  100794:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100797:	01 d0                	add    %edx,%eax
  100799:	8b 40 08             	mov    0x8(%eax),%eax
  10079c:	85 c0                	test   %eax,%eax
  10079e:	74 97                	je     100737 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1007a0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a6:	39 c2                	cmp    %eax,%edx
  1007a8:	7c 46                	jl     1007f0 <debuginfo_eip+0x2e2>
  1007aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ad:	89 c2                	mov    %eax,%edx
  1007af:	89 d0                	mov    %edx,%eax
  1007b1:	01 c0                	add    %eax,%eax
  1007b3:	01 d0                	add    %edx,%eax
  1007b5:	c1 e0 02             	shl    $0x2,%eax
  1007b8:	89 c2                	mov    %eax,%edx
  1007ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007bd:	01 d0                	add    %edx,%eax
  1007bf:	8b 10                	mov    (%eax),%edx
  1007c1:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c7:	29 c1                	sub    %eax,%ecx
  1007c9:	89 c8                	mov    %ecx,%eax
  1007cb:	39 c2                	cmp    %eax,%edx
  1007cd:	73 21                	jae    1007f0 <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007d2:	89 c2                	mov    %eax,%edx
  1007d4:	89 d0                	mov    %edx,%eax
  1007d6:	01 c0                	add    %eax,%eax
  1007d8:	01 d0                	add    %edx,%eax
  1007da:	c1 e0 02             	shl    $0x2,%eax
  1007dd:	89 c2                	mov    %eax,%edx
  1007df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e2:	01 d0                	add    %edx,%eax
  1007e4:	8b 10                	mov    (%eax),%edx
  1007e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e9:	01 c2                	add    %eax,%edx
  1007eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f6:	39 c2                	cmp    %eax,%edx
  1007f8:	7d 4a                	jge    100844 <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007fd:	83 c0 01             	add    $0x1,%eax
  100800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100803:	eb 18                	jmp    10081d <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100805:	8b 45 0c             	mov    0xc(%ebp),%eax
  100808:	8b 40 14             	mov    0x14(%eax),%eax
  10080b:	8d 50 01             	lea    0x1(%eax),%edx
  10080e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100811:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  100814:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100817:	83 c0 01             	add    $0x1,%eax
  10081a:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10081d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100820:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  100823:	39 c2                	cmp    %eax,%edx
  100825:	7d 1d                	jge    100844 <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100827:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10082a:	89 c2                	mov    %eax,%edx
  10082c:	89 d0                	mov    %edx,%eax
  10082e:	01 c0                	add    %eax,%eax
  100830:	01 d0                	add    %edx,%eax
  100832:	c1 e0 02             	shl    $0x2,%eax
  100835:	89 c2                	mov    %eax,%edx
  100837:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10083a:	01 d0                	add    %edx,%eax
  10083c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100840:	3c a0                	cmp    $0xa0,%al
  100842:	74 c1                	je     100805 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  100844:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100849:	c9                   	leave  
  10084a:	c3                   	ret    

0010084b <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  10084b:	55                   	push   %ebp
  10084c:	89 e5                	mov    %esp,%ebp
  10084e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100851:	c7 04 24 b6 34 10 00 	movl   $0x1034b6,(%esp)
  100858:	e8 ba fa ff ff       	call   100317 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10085d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100864:	00 
  100865:	c7 04 24 cf 34 10 00 	movl   $0x1034cf,(%esp)
  10086c:	e8 a6 fa ff ff       	call   100317 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100871:	c7 44 24 04 f2 33 10 	movl   $0x1033f2,0x4(%esp)
  100878:	00 
  100879:	c7 04 24 e7 34 10 00 	movl   $0x1034e7,(%esp)
  100880:	e8 92 fa ff ff       	call   100317 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100885:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  10088c:	00 
  10088d:	c7 04 24 ff 34 10 00 	movl   $0x1034ff,(%esp)
  100894:	e8 7e fa ff ff       	call   100317 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100899:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  1008a0:	00 
  1008a1:	c7 04 24 17 35 10 00 	movl   $0x103517,(%esp)
  1008a8:	e8 6a fa ff ff       	call   100317 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008ad:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008b2:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b8:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008bd:	29 c2                	sub    %eax,%edx
  1008bf:	89 d0                	mov    %edx,%eax
  1008c1:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c7:	85 c0                	test   %eax,%eax
  1008c9:	0f 48 c2             	cmovs  %edx,%eax
  1008cc:	c1 f8 0a             	sar    $0xa,%eax
  1008cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008d3:	c7 04 24 30 35 10 00 	movl   $0x103530,(%esp)
  1008da:	e8 38 fa ff ff       	call   100317 <cprintf>
}
  1008df:	c9                   	leave  
  1008e0:	c3                   	ret    

001008e1 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008e1:	55                   	push   %ebp
  1008e2:	89 e5                	mov    %esp,%ebp
  1008e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f4:	89 04 24             	mov    %eax,(%esp)
  1008f7:	e8 12 fc ff ff       	call   10050e <debuginfo_eip>
  1008fc:	85 c0                	test   %eax,%eax
  1008fe:	74 15                	je     100915 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100900:	8b 45 08             	mov    0x8(%ebp),%eax
  100903:	89 44 24 04          	mov    %eax,0x4(%esp)
  100907:	c7 04 24 5a 35 10 00 	movl   $0x10355a,(%esp)
  10090e:	e8 04 fa ff ff       	call   100317 <cprintf>
  100913:	eb 6d                	jmp    100982 <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100915:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10091c:	eb 1c                	jmp    10093a <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  10091e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100921:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100924:	01 d0                	add    %edx,%eax
  100926:	0f b6 00             	movzbl (%eax),%eax
  100929:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100932:	01 ca                	add    %ecx,%edx
  100934:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100936:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10093a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10093d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100940:	7f dc                	jg     10091e <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100942:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100948:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10094b:	01 d0                	add    %edx,%eax
  10094d:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100950:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100953:	8b 55 08             	mov    0x8(%ebp),%edx
  100956:	89 d1                	mov    %edx,%ecx
  100958:	29 c1                	sub    %eax,%ecx
  10095a:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10095d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100960:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100964:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10096a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  10096e:	89 54 24 08          	mov    %edx,0x8(%esp)
  100972:	89 44 24 04          	mov    %eax,0x4(%esp)
  100976:	c7 04 24 76 35 10 00 	movl   $0x103576,(%esp)
  10097d:	e8 95 f9 ff ff       	call   100317 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  100982:	c9                   	leave  
  100983:	c3                   	ret    

00100984 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100984:	55                   	push   %ebp
  100985:	89 e5                	mov    %esp,%ebp
  100987:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  10098a:	8b 45 04             	mov    0x4(%ebp),%eax
  10098d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100990:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100993:	c9                   	leave  
  100994:	c3                   	ret    

00100995 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100995:	55                   	push   %ebp
  100996:	89 e5                	mov    %esp,%ebp
  100998:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  10099b:	89 e8                	mov    %ebp,%eax
  10099d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  1009a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp = read_ebp();
  1009a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	uint32_t eip = read_eip();
  1009a6:	e8 d9 ff ff ff       	call   100984 <read_eip>
  1009ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i=0,j=0;
  1009ae:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009b5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
	for (i = 0 ; ebp != 0 && i < STACKFRAME_DEPTH; i++){
  1009bc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009c3:	e9 88 00 00 00       	jmp    100a50 <print_stackframe+0xbb>
		cprintf("ebp:0x%08x eip:0x%08x args:",ebp,eip);
  1009c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009cb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009d6:	c7 04 24 88 35 10 00 	movl   $0x103588,(%esp)
  1009dd:	e8 35 f9 ff ff       	call   100317 <cprintf>
		uint32_t *args =(uint32_t *) ebp + 2;
  1009e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e5:	83 c0 08             	add    $0x8,%eax
  1009e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		for(j =0 ; j < 4; j++){
  1009eb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009f2:	eb 25                	jmp    100a19 <print_stackframe+0x84>
			cprintf("0x%08x ",args[j]);
  1009f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009f7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100a01:	01 d0                	add    %edx,%eax
  100a03:	8b 00                	mov    (%eax),%eax
  100a05:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a09:	c7 04 24 a4 35 10 00 	movl   $0x1035a4,(%esp)
  100a10:	e8 02 f9 ff ff       	call   100317 <cprintf>
	uint32_t eip = read_eip();
	int i=0,j=0;
	for (i = 0 ; ebp != 0 && i < STACKFRAME_DEPTH; i++){
		cprintf("ebp:0x%08x eip:0x%08x args:",ebp,eip);
		uint32_t *args =(uint32_t *) ebp + 2;
		for(j =0 ; j < 4; j++){
  100a15:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a19:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a1d:	7e d5                	jle    1009f4 <print_stackframe+0x5f>
			cprintf("0x%08x ",args[j]);
		}
		cprintf("\n");
  100a1f:	c7 04 24 ac 35 10 00 	movl   $0x1035ac,(%esp)
  100a26:	e8 ec f8 ff ff       	call   100317 <cprintf>
		print_debuginfo(eip-1);
  100a2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a2e:	83 e8 01             	sub    $0x1,%eax
  100a31:	89 04 24             	mov    %eax,(%esp)
  100a34:	e8 a8 fe ff ff       	call   1008e1 <print_debuginfo>
		eip = ((uint32_t *)ebp)[1];
  100a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a3c:	83 c0 04             	add    $0x4,%eax
  100a3f:	8b 00                	mov    (%eax),%eax
  100a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
		ebp = ((uint32_t *)ebp)[0];
  100a44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a47:	8b 00                	mov    (%eax),%eax
  100a49:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp = read_ebp();
	uint32_t eip = read_eip();
	int i=0,j=0;
	for (i = 0 ; ebp != 0 && i < STACKFRAME_DEPTH; i++){
  100a4c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a54:	74 0a                	je     100a60 <print_stackframe+0xcb>
  100a56:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a5a:	0f 8e 68 ff ff ff    	jle    1009c8 <print_stackframe+0x33>
//	        print_debuginfo(eip - 1);
//	        eip = ((uint32_t *)ebp)[1];
//	        ebp = ((uint32_t *)ebp)[0];
//	    }

}
  100a60:	c9                   	leave  
  100a61:	c3                   	ret    

00100a62 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a62:	55                   	push   %ebp
  100a63:	89 e5                	mov    %esp,%ebp
  100a65:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a6f:	eb 0c                	jmp    100a7d <parse+0x1b>
            *buf ++ = '\0';
  100a71:	8b 45 08             	mov    0x8(%ebp),%eax
  100a74:	8d 50 01             	lea    0x1(%eax),%edx
  100a77:	89 55 08             	mov    %edx,0x8(%ebp)
  100a7a:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a7d:	8b 45 08             	mov    0x8(%ebp),%eax
  100a80:	0f b6 00             	movzbl (%eax),%eax
  100a83:	84 c0                	test   %al,%al
  100a85:	74 1d                	je     100aa4 <parse+0x42>
  100a87:	8b 45 08             	mov    0x8(%ebp),%eax
  100a8a:	0f b6 00             	movzbl (%eax),%eax
  100a8d:	0f be c0             	movsbl %al,%eax
  100a90:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a94:	c7 04 24 30 36 10 00 	movl   $0x103630,(%esp)
  100a9b:	e8 0a 26 00 00       	call   1030aa <strchr>
  100aa0:	85 c0                	test   %eax,%eax
  100aa2:	75 cd                	jne    100a71 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100aa4:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa7:	0f b6 00             	movzbl (%eax),%eax
  100aaa:	84 c0                	test   %al,%al
  100aac:	75 02                	jne    100ab0 <parse+0x4e>
            break;
  100aae:	eb 67                	jmp    100b17 <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100ab0:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100ab4:	75 14                	jne    100aca <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100ab6:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100abd:	00 
  100abe:	c7 04 24 35 36 10 00 	movl   $0x103635,(%esp)
  100ac5:	e8 4d f8 ff ff       	call   100317 <cprintf>
        }
        argv[argc ++] = buf;
  100aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acd:	8d 50 01             	lea    0x1(%eax),%edx
  100ad0:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ad3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ada:	8b 45 0c             	mov    0xc(%ebp),%eax
  100add:	01 c2                	add    %eax,%edx
  100adf:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae2:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ae4:	eb 04                	jmp    100aea <parse+0x88>
            buf ++;
  100ae6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100aea:	8b 45 08             	mov    0x8(%ebp),%eax
  100aed:	0f b6 00             	movzbl (%eax),%eax
  100af0:	84 c0                	test   %al,%al
  100af2:	74 1d                	je     100b11 <parse+0xaf>
  100af4:	8b 45 08             	mov    0x8(%ebp),%eax
  100af7:	0f b6 00             	movzbl (%eax),%eax
  100afa:	0f be c0             	movsbl %al,%eax
  100afd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b01:	c7 04 24 30 36 10 00 	movl   $0x103630,(%esp)
  100b08:	e8 9d 25 00 00       	call   1030aa <strchr>
  100b0d:	85 c0                	test   %eax,%eax
  100b0f:	74 d5                	je     100ae6 <parse+0x84>
            buf ++;
        }
    }
  100b11:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b12:	e9 66 ff ff ff       	jmp    100a7d <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b17:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b1a:	c9                   	leave  
  100b1b:	c3                   	ret    

00100b1c <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b1c:	55                   	push   %ebp
  100b1d:	89 e5                	mov    %esp,%ebp
  100b1f:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b22:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b25:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b29:	8b 45 08             	mov    0x8(%ebp),%eax
  100b2c:	89 04 24             	mov    %eax,(%esp)
  100b2f:	e8 2e ff ff ff       	call   100a62 <parse>
  100b34:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b37:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b3b:	75 0a                	jne    100b47 <runcmd+0x2b>
        return 0;
  100b3d:	b8 00 00 00 00       	mov    $0x0,%eax
  100b42:	e9 85 00 00 00       	jmp    100bcc <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b47:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b4e:	eb 5c                	jmp    100bac <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b50:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b53:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b56:	89 d0                	mov    %edx,%eax
  100b58:	01 c0                	add    %eax,%eax
  100b5a:	01 d0                	add    %edx,%eax
  100b5c:	c1 e0 02             	shl    $0x2,%eax
  100b5f:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b64:	8b 00                	mov    (%eax),%eax
  100b66:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b6a:	89 04 24             	mov    %eax,(%esp)
  100b6d:	e8 99 24 00 00       	call   10300b <strcmp>
  100b72:	85 c0                	test   %eax,%eax
  100b74:	75 32                	jne    100ba8 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b76:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b79:	89 d0                	mov    %edx,%eax
  100b7b:	01 c0                	add    %eax,%eax
  100b7d:	01 d0                	add    %edx,%eax
  100b7f:	c1 e0 02             	shl    $0x2,%eax
  100b82:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b87:	8b 40 08             	mov    0x8(%eax),%eax
  100b8a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b8d:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b90:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b93:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b97:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b9a:	83 c2 04             	add    $0x4,%edx
  100b9d:	89 54 24 04          	mov    %edx,0x4(%esp)
  100ba1:	89 0c 24             	mov    %ecx,(%esp)
  100ba4:	ff d0                	call   *%eax
  100ba6:	eb 24                	jmp    100bcc <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ba8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100bac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100baf:	83 f8 02             	cmp    $0x2,%eax
  100bb2:	76 9c                	jbe    100b50 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100bb4:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100bb7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bbb:	c7 04 24 53 36 10 00 	movl   $0x103653,(%esp)
  100bc2:	e8 50 f7 ff ff       	call   100317 <cprintf>
    return 0;
  100bc7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bcc:	c9                   	leave  
  100bcd:	c3                   	ret    

00100bce <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bce:	55                   	push   %ebp
  100bcf:	89 e5                	mov    %esp,%ebp
  100bd1:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bd4:	c7 04 24 6c 36 10 00 	movl   $0x10366c,(%esp)
  100bdb:	e8 37 f7 ff ff       	call   100317 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100be0:	c7 04 24 94 36 10 00 	movl   $0x103694,(%esp)
  100be7:	e8 2b f7 ff ff       	call   100317 <cprintf>

    if (tf != NULL) {
  100bec:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bf0:	74 0b                	je     100bfd <kmonitor+0x2f>
        print_trapframe(tf);
  100bf2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf5:	89 04 24             	mov    %eax,(%esp)
  100bf8:	e8 4d 0d 00 00       	call   10194a <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bfd:	c7 04 24 b9 36 10 00 	movl   $0x1036b9,(%esp)
  100c04:	e8 05 f6 ff ff       	call   10020e <readline>
  100c09:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c10:	74 18                	je     100c2a <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100c12:	8b 45 08             	mov    0x8(%ebp),%eax
  100c15:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c1c:	89 04 24             	mov    %eax,(%esp)
  100c1f:	e8 f8 fe ff ff       	call   100b1c <runcmd>
  100c24:	85 c0                	test   %eax,%eax
  100c26:	79 02                	jns    100c2a <kmonitor+0x5c>
                break;
  100c28:	eb 02                	jmp    100c2c <kmonitor+0x5e>
            }
        }
    }
  100c2a:	eb d1                	jmp    100bfd <kmonitor+0x2f>
}
  100c2c:	c9                   	leave  
  100c2d:	c3                   	ret    

00100c2e <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c2e:	55                   	push   %ebp
  100c2f:	89 e5                	mov    %esp,%ebp
  100c31:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c34:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c3b:	eb 3f                	jmp    100c7c <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c40:	89 d0                	mov    %edx,%eax
  100c42:	01 c0                	add    %eax,%eax
  100c44:	01 d0                	add    %edx,%eax
  100c46:	c1 e0 02             	shl    $0x2,%eax
  100c49:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c4e:	8b 48 04             	mov    0x4(%eax),%ecx
  100c51:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c54:	89 d0                	mov    %edx,%eax
  100c56:	01 c0                	add    %eax,%eax
  100c58:	01 d0                	add    %edx,%eax
  100c5a:	c1 e0 02             	shl    $0x2,%eax
  100c5d:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c62:	8b 00                	mov    (%eax),%eax
  100c64:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c68:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c6c:	c7 04 24 bd 36 10 00 	movl   $0x1036bd,(%esp)
  100c73:	e8 9f f6 ff ff       	call   100317 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c78:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c7f:	83 f8 02             	cmp    $0x2,%eax
  100c82:	76 b9                	jbe    100c3d <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c84:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c89:	c9                   	leave  
  100c8a:	c3                   	ret    

00100c8b <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c8b:	55                   	push   %ebp
  100c8c:	89 e5                	mov    %esp,%ebp
  100c8e:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c91:	e8 b5 fb ff ff       	call   10084b <print_kerninfo>
    return 0;
  100c96:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c9b:	c9                   	leave  
  100c9c:	c3                   	ret    

00100c9d <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c9d:	55                   	push   %ebp
  100c9e:	89 e5                	mov    %esp,%ebp
  100ca0:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100ca3:	e8 ed fc ff ff       	call   100995 <print_stackframe>
    return 0;
  100ca8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cad:	c9                   	leave  
  100cae:	c3                   	ret    

00100caf <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100caf:	55                   	push   %ebp
  100cb0:	89 e5                	mov    %esp,%ebp
  100cb2:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100cb5:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100cba:	85 c0                	test   %eax,%eax
  100cbc:	74 02                	je     100cc0 <__panic+0x11>
        goto panic_dead;
  100cbe:	eb 48                	jmp    100d08 <__panic+0x59>
    }
    is_panic = 1;
  100cc0:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cc7:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cca:	8d 45 14             	lea    0x14(%ebp),%eax
  100ccd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cd3:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
  100cda:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cde:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  100ce5:	e8 2d f6 ff ff       	call   100317 <cprintf>
    vcprintf(fmt, ap);
  100cea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ced:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cf1:	8b 45 10             	mov    0x10(%ebp),%eax
  100cf4:	89 04 24             	mov    %eax,(%esp)
  100cf7:	e8 e8 f5 ff ff       	call   1002e4 <vcprintf>
    cprintf("\n");
  100cfc:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  100d03:	e8 0f f6 ff ff       	call   100317 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100d08:	e8 22 09 00 00       	call   10162f <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d0d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d14:	e8 b5 fe ff ff       	call   100bce <kmonitor>
    }
  100d19:	eb f2                	jmp    100d0d <__panic+0x5e>

00100d1b <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d1b:	55                   	push   %ebp
  100d1c:	89 e5                	mov    %esp,%ebp
  100d1e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d21:	8d 45 14             	lea    0x14(%ebp),%eax
  100d24:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d27:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d2a:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d2e:	8b 45 08             	mov    0x8(%ebp),%eax
  100d31:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d35:	c7 04 24 e4 36 10 00 	movl   $0x1036e4,(%esp)
  100d3c:	e8 d6 f5 ff ff       	call   100317 <cprintf>
    vcprintf(fmt, ap);
  100d41:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d44:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d48:	8b 45 10             	mov    0x10(%ebp),%eax
  100d4b:	89 04 24             	mov    %eax,(%esp)
  100d4e:	e8 91 f5 ff ff       	call   1002e4 <vcprintf>
    cprintf("\n");
  100d53:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  100d5a:	e8 b8 f5 ff ff       	call   100317 <cprintf>
    va_end(ap);
}
  100d5f:	c9                   	leave  
  100d60:	c3                   	ret    

00100d61 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d61:	55                   	push   %ebp
  100d62:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d64:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d69:	5d                   	pop    %ebp
  100d6a:	c3                   	ret    

00100d6b <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d6b:	55                   	push   %ebp
  100d6c:	89 e5                	mov    %esp,%ebp
  100d6e:	83 ec 28             	sub    $0x28,%esp
  100d71:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d77:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d7b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d7f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d83:	ee                   	out    %al,(%dx)
  100d84:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d8a:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d8e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d92:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d96:	ee                   	out    %al,(%dx)
  100d97:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d9d:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100da1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100da5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100da9:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100daa:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100db1:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100db4:	c7 04 24 02 37 10 00 	movl   $0x103702,(%esp)
  100dbb:	e8 57 f5 ff ff       	call   100317 <cprintf>
    pic_enable(IRQ_TIMER);
  100dc0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dc7:	e8 c1 08 00 00       	call   10168d <pic_enable>
}
  100dcc:	c9                   	leave  
  100dcd:	c3                   	ret    

00100dce <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dce:	55                   	push   %ebp
  100dcf:	89 e5                	mov    %esp,%ebp
  100dd1:	83 ec 10             	sub    $0x10,%esp
  100dd4:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dda:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dde:	89 c2                	mov    %eax,%edx
  100de0:	ec                   	in     (%dx),%al
  100de1:	88 45 fd             	mov    %al,-0x3(%ebp)
  100de4:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dea:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dee:	89 c2                	mov    %eax,%edx
  100df0:	ec                   	in     (%dx),%al
  100df1:	88 45 f9             	mov    %al,-0x7(%ebp)
  100df4:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dfa:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dfe:	89 c2                	mov    %eax,%edx
  100e00:	ec                   	in     (%dx),%al
  100e01:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e04:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100e0a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e0e:	89 c2                	mov    %eax,%edx
  100e10:	ec                   	in     (%dx),%al
  100e11:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e14:	c9                   	leave  
  100e15:	c3                   	ret    

00100e16 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e16:	55                   	push   %ebp
  100e17:	89 e5                	mov    %esp,%ebp
  100e19:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e1c:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e23:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e26:	0f b7 00             	movzwl (%eax),%eax
  100e29:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e30:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e35:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e38:	0f b7 00             	movzwl (%eax),%eax
  100e3b:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e3f:	74 12                	je     100e53 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e41:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e48:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e4f:	b4 03 
  100e51:	eb 13                	jmp    100e66 <cga_init+0x50>
    } else {
        *cp = was;
  100e53:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e56:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e5a:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e5d:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e64:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e66:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e6d:	0f b7 c0             	movzwl %ax,%eax
  100e70:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e74:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e78:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e7c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e80:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e81:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e88:	83 c0 01             	add    $0x1,%eax
  100e8b:	0f b7 c0             	movzwl %ax,%eax
  100e8e:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e92:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e96:	89 c2                	mov    %eax,%edx
  100e98:	ec                   	in     (%dx),%al
  100e99:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e9c:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ea0:	0f b6 c0             	movzbl %al,%eax
  100ea3:	c1 e0 08             	shl    $0x8,%eax
  100ea6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ea9:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eb0:	0f b7 c0             	movzwl %ax,%eax
  100eb3:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100eb7:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ebb:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ebf:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ec3:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100ec4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ecb:	83 c0 01             	add    $0x1,%eax
  100ece:	0f b7 c0             	movzwl %ax,%eax
  100ed1:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ed5:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ed9:	89 c2                	mov    %eax,%edx
  100edb:	ec                   	in     (%dx),%al
  100edc:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100edf:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ee3:	0f b6 c0             	movzbl %al,%eax
  100ee6:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100ee9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eec:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100ef1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100efa:	c9                   	leave  
  100efb:	c3                   	ret    

00100efc <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100efc:	55                   	push   %ebp
  100efd:	89 e5                	mov    %esp,%ebp
  100eff:	83 ec 48             	sub    $0x48,%esp
  100f02:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f08:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f0c:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f10:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f14:	ee                   	out    %al,(%dx)
  100f15:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f1b:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f1f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f23:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f27:	ee                   	out    %al,(%dx)
  100f28:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f2e:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f32:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f36:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f3a:	ee                   	out    %al,(%dx)
  100f3b:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f41:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f45:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f49:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f4d:	ee                   	out    %al,(%dx)
  100f4e:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f54:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f58:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f5c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f60:	ee                   	out    %al,(%dx)
  100f61:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f67:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f6b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f6f:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f73:	ee                   	out    %al,(%dx)
  100f74:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f7a:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f7e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f82:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f86:	ee                   	out    %al,(%dx)
  100f87:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8d:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f91:	89 c2                	mov    %eax,%edx
  100f93:	ec                   	in     (%dx),%al
  100f94:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f97:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f9b:	3c ff                	cmp    $0xff,%al
  100f9d:	0f 95 c0             	setne  %al
  100fa0:	0f b6 c0             	movzbl %al,%eax
  100fa3:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fa8:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fae:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100fb2:	89 c2                	mov    %eax,%edx
  100fb4:	ec                   	in     (%dx),%al
  100fb5:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fb8:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fbe:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fc2:	89 c2                	mov    %eax,%edx
  100fc4:	ec                   	in     (%dx),%al
  100fc5:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fc8:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fcd:	85 c0                	test   %eax,%eax
  100fcf:	74 0c                	je     100fdd <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fd1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fd8:	e8 b0 06 00 00       	call   10168d <pic_enable>
    }
}
  100fdd:	c9                   	leave  
  100fde:	c3                   	ret    

00100fdf <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fdf:	55                   	push   %ebp
  100fe0:	89 e5                	mov    %esp,%ebp
  100fe2:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fec:	eb 09                	jmp    100ff7 <lpt_putc_sub+0x18>
        delay();
  100fee:	e8 db fd ff ff       	call   100dce <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100ff7:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ffd:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101001:	89 c2                	mov    %eax,%edx
  101003:	ec                   	in     (%dx),%al
  101004:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101007:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10100b:	84 c0                	test   %al,%al
  10100d:	78 09                	js     101018 <lpt_putc_sub+0x39>
  10100f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101016:	7e d6                	jle    100fee <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  101018:	8b 45 08             	mov    0x8(%ebp),%eax
  10101b:	0f b6 c0             	movzbl %al,%eax
  10101e:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  101024:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101027:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10102b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10102f:	ee                   	out    %al,(%dx)
  101030:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101036:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10103a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10103e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101042:	ee                   	out    %al,(%dx)
  101043:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101049:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  10104d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101051:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101055:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101056:	c9                   	leave  
  101057:	c3                   	ret    

00101058 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101058:	55                   	push   %ebp
  101059:	89 e5                	mov    %esp,%ebp
  10105b:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10105e:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101062:	74 0d                	je     101071 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101064:	8b 45 08             	mov    0x8(%ebp),%eax
  101067:	89 04 24             	mov    %eax,(%esp)
  10106a:	e8 70 ff ff ff       	call   100fdf <lpt_putc_sub>
  10106f:	eb 24                	jmp    101095 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101071:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101078:	e8 62 ff ff ff       	call   100fdf <lpt_putc_sub>
        lpt_putc_sub(' ');
  10107d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101084:	e8 56 ff ff ff       	call   100fdf <lpt_putc_sub>
        lpt_putc_sub('\b');
  101089:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101090:	e8 4a ff ff ff       	call   100fdf <lpt_putc_sub>
    }
}
  101095:	c9                   	leave  
  101096:	c3                   	ret    

00101097 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101097:	55                   	push   %ebp
  101098:	89 e5                	mov    %esp,%ebp
  10109a:	53                   	push   %ebx
  10109b:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10109e:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a1:	b0 00                	mov    $0x0,%al
  1010a3:	85 c0                	test   %eax,%eax
  1010a5:	75 07                	jne    1010ae <cga_putc+0x17>
        c |= 0x0700;
  1010a7:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b1:	0f b6 c0             	movzbl %al,%eax
  1010b4:	83 f8 0a             	cmp    $0xa,%eax
  1010b7:	74 4c                	je     101105 <cga_putc+0x6e>
  1010b9:	83 f8 0d             	cmp    $0xd,%eax
  1010bc:	74 57                	je     101115 <cga_putc+0x7e>
  1010be:	83 f8 08             	cmp    $0x8,%eax
  1010c1:	0f 85 88 00 00 00    	jne    10114f <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010c7:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ce:	66 85 c0             	test   %ax,%ax
  1010d1:	74 30                	je     101103 <cga_putc+0x6c>
            crt_pos --;
  1010d3:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010da:	83 e8 01             	sub    $0x1,%eax
  1010dd:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010e3:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010e8:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010ef:	0f b7 d2             	movzwl %dx,%edx
  1010f2:	01 d2                	add    %edx,%edx
  1010f4:	01 c2                	add    %eax,%edx
  1010f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f9:	b0 00                	mov    $0x0,%al
  1010fb:	83 c8 20             	or     $0x20,%eax
  1010fe:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101101:	eb 72                	jmp    101175 <cga_putc+0xde>
  101103:	eb 70                	jmp    101175 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  101105:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10110c:	83 c0 50             	add    $0x50,%eax
  10110f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101115:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10111c:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101123:	0f b7 c1             	movzwl %cx,%eax
  101126:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10112c:	c1 e8 10             	shr    $0x10,%eax
  10112f:	89 c2                	mov    %eax,%edx
  101131:	66 c1 ea 06          	shr    $0x6,%dx
  101135:	89 d0                	mov    %edx,%eax
  101137:	c1 e0 02             	shl    $0x2,%eax
  10113a:	01 d0                	add    %edx,%eax
  10113c:	c1 e0 04             	shl    $0x4,%eax
  10113f:	29 c1                	sub    %eax,%ecx
  101141:	89 ca                	mov    %ecx,%edx
  101143:	89 d8                	mov    %ebx,%eax
  101145:	29 d0                	sub    %edx,%eax
  101147:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10114d:	eb 26                	jmp    101175 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10114f:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101155:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10115c:	8d 50 01             	lea    0x1(%eax),%edx
  10115f:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101166:	0f b7 c0             	movzwl %ax,%eax
  101169:	01 c0                	add    %eax,%eax
  10116b:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10116e:	8b 45 08             	mov    0x8(%ebp),%eax
  101171:	66 89 02             	mov    %ax,(%edx)
        break;
  101174:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101175:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10117c:	66 3d cf 07          	cmp    $0x7cf,%ax
  101180:	76 5b                	jbe    1011dd <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101182:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101187:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10118d:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101192:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101199:	00 
  10119a:	89 54 24 04          	mov    %edx,0x4(%esp)
  10119e:	89 04 24             	mov    %eax,(%esp)
  1011a1:	e8 02 21 00 00       	call   1032a8 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a6:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011ad:	eb 15                	jmp    1011c4 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1011af:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011b7:	01 d2                	add    %edx,%edx
  1011b9:	01 d0                	add    %edx,%eax
  1011bb:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011c4:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011cb:	7e e2                	jle    1011af <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011cd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011d4:	83 e8 50             	sub    $0x50,%eax
  1011d7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011dd:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011e4:	0f b7 c0             	movzwl %ax,%eax
  1011e7:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011eb:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011ef:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011f3:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011f7:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011f8:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ff:	66 c1 e8 08          	shr    $0x8,%ax
  101203:	0f b6 c0             	movzbl %al,%eax
  101206:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10120d:	83 c2 01             	add    $0x1,%edx
  101210:	0f b7 d2             	movzwl %dx,%edx
  101213:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101217:	88 45 ed             	mov    %al,-0x13(%ebp)
  10121a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10121e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101222:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101223:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10122a:	0f b7 c0             	movzwl %ax,%eax
  10122d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101231:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101235:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101239:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10123d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10123e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101245:	0f b6 c0             	movzbl %al,%eax
  101248:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10124f:	83 c2 01             	add    $0x1,%edx
  101252:	0f b7 d2             	movzwl %dx,%edx
  101255:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101259:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10125c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101260:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101264:	ee                   	out    %al,(%dx)
}
  101265:	83 c4 34             	add    $0x34,%esp
  101268:	5b                   	pop    %ebx
  101269:	5d                   	pop    %ebp
  10126a:	c3                   	ret    

0010126b <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10126b:	55                   	push   %ebp
  10126c:	89 e5                	mov    %esp,%ebp
  10126e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101271:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101278:	eb 09                	jmp    101283 <serial_putc_sub+0x18>
        delay();
  10127a:	e8 4f fb ff ff       	call   100dce <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10127f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101283:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101289:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10128d:	89 c2                	mov    %eax,%edx
  10128f:	ec                   	in     (%dx),%al
  101290:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101293:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101297:	0f b6 c0             	movzbl %al,%eax
  10129a:	83 e0 20             	and    $0x20,%eax
  10129d:	85 c0                	test   %eax,%eax
  10129f:	75 09                	jne    1012aa <serial_putc_sub+0x3f>
  1012a1:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012a8:	7e d0                	jle    10127a <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ad:	0f b6 c0             	movzbl %al,%eax
  1012b0:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012b6:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012bd:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012c1:	ee                   	out    %al,(%dx)
}
  1012c2:	c9                   	leave  
  1012c3:	c3                   	ret    

001012c4 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012c4:	55                   	push   %ebp
  1012c5:	89 e5                	mov    %esp,%ebp
  1012c7:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012ca:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012ce:	74 0d                	je     1012dd <serial_putc+0x19>
        serial_putc_sub(c);
  1012d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d3:	89 04 24             	mov    %eax,(%esp)
  1012d6:	e8 90 ff ff ff       	call   10126b <serial_putc_sub>
  1012db:	eb 24                	jmp    101301 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012dd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e4:	e8 82 ff ff ff       	call   10126b <serial_putc_sub>
        serial_putc_sub(' ');
  1012e9:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012f0:	e8 76 ff ff ff       	call   10126b <serial_putc_sub>
        serial_putc_sub('\b');
  1012f5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012fc:	e8 6a ff ff ff       	call   10126b <serial_putc_sub>
    }
}
  101301:	c9                   	leave  
  101302:	c3                   	ret    

00101303 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101303:	55                   	push   %ebp
  101304:	89 e5                	mov    %esp,%ebp
  101306:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101309:	eb 33                	jmp    10133e <cons_intr+0x3b>
        if (c != 0) {
  10130b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10130f:	74 2d                	je     10133e <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101311:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101316:	8d 50 01             	lea    0x1(%eax),%edx
  101319:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  10131f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101322:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101328:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10132d:	3d 00 02 00 00       	cmp    $0x200,%eax
  101332:	75 0a                	jne    10133e <cons_intr+0x3b>
                cons.wpos = 0;
  101334:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10133b:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10133e:	8b 45 08             	mov    0x8(%ebp),%eax
  101341:	ff d0                	call   *%eax
  101343:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101346:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10134a:	75 bf                	jne    10130b <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10134c:	c9                   	leave  
  10134d:	c3                   	ret    

0010134e <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10134e:	55                   	push   %ebp
  10134f:	89 e5                	mov    %esp,%ebp
  101351:	83 ec 10             	sub    $0x10,%esp
  101354:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10135a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10135e:	89 c2                	mov    %eax,%edx
  101360:	ec                   	in     (%dx),%al
  101361:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101364:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101368:	0f b6 c0             	movzbl %al,%eax
  10136b:	83 e0 01             	and    $0x1,%eax
  10136e:	85 c0                	test   %eax,%eax
  101370:	75 07                	jne    101379 <serial_proc_data+0x2b>
        return -1;
  101372:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101377:	eb 2a                	jmp    1013a3 <serial_proc_data+0x55>
  101379:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10137f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101383:	89 c2                	mov    %eax,%edx
  101385:	ec                   	in     (%dx),%al
  101386:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101389:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10138d:	0f b6 c0             	movzbl %al,%eax
  101390:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101393:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101397:	75 07                	jne    1013a0 <serial_proc_data+0x52>
        c = '\b';
  101399:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013a3:	c9                   	leave  
  1013a4:	c3                   	ret    

001013a5 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013a5:	55                   	push   %ebp
  1013a6:	89 e5                	mov    %esp,%ebp
  1013a8:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013ab:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013b0:	85 c0                	test   %eax,%eax
  1013b2:	74 0c                	je     1013c0 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013b4:	c7 04 24 4e 13 10 00 	movl   $0x10134e,(%esp)
  1013bb:	e8 43 ff ff ff       	call   101303 <cons_intr>
    }
}
  1013c0:	c9                   	leave  
  1013c1:	c3                   	ret    

001013c2 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013c2:	55                   	push   %ebp
  1013c3:	89 e5                	mov    %esp,%ebp
  1013c5:	83 ec 38             	sub    $0x38,%esp
  1013c8:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ce:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013d2:	89 c2                	mov    %eax,%edx
  1013d4:	ec                   	in     (%dx),%al
  1013d5:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013d8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013dc:	0f b6 c0             	movzbl %al,%eax
  1013df:	83 e0 01             	and    $0x1,%eax
  1013e2:	85 c0                	test   %eax,%eax
  1013e4:	75 0a                	jne    1013f0 <kbd_proc_data+0x2e>
        return -1;
  1013e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013eb:	e9 59 01 00 00       	jmp    101549 <kbd_proc_data+0x187>
  1013f0:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013f6:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013fa:	89 c2                	mov    %eax,%edx
  1013fc:	ec                   	in     (%dx),%al
  1013fd:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101400:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101404:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101407:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10140b:	75 17                	jne    101424 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  10140d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101412:	83 c8 40             	or     $0x40,%eax
  101415:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10141a:	b8 00 00 00 00       	mov    $0x0,%eax
  10141f:	e9 25 01 00 00       	jmp    101549 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101424:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101428:	84 c0                	test   %al,%al
  10142a:	79 47                	jns    101473 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10142c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101431:	83 e0 40             	and    $0x40,%eax
  101434:	85 c0                	test   %eax,%eax
  101436:	75 09                	jne    101441 <kbd_proc_data+0x7f>
  101438:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143c:	83 e0 7f             	and    $0x7f,%eax
  10143f:	eb 04                	jmp    101445 <kbd_proc_data+0x83>
  101441:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101445:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101448:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10144c:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101453:	83 c8 40             	or     $0x40,%eax
  101456:	0f b6 c0             	movzbl %al,%eax
  101459:	f7 d0                	not    %eax
  10145b:	89 c2                	mov    %eax,%edx
  10145d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101462:	21 d0                	and    %edx,%eax
  101464:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101469:	b8 00 00 00 00       	mov    $0x0,%eax
  10146e:	e9 d6 00 00 00       	jmp    101549 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101473:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101478:	83 e0 40             	and    $0x40,%eax
  10147b:	85 c0                	test   %eax,%eax
  10147d:	74 11                	je     101490 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10147f:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101483:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101488:	83 e0 bf             	and    $0xffffffbf,%eax
  10148b:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101490:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101494:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10149b:	0f b6 d0             	movzbl %al,%edx
  10149e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a3:	09 d0                	or     %edx,%eax
  1014a5:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014aa:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ae:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014b5:	0f b6 d0             	movzbl %al,%edx
  1014b8:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014bd:	31 d0                	xor    %edx,%eax
  1014bf:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014c4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c9:	83 e0 03             	and    $0x3,%eax
  1014cc:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014d3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014d7:	01 d0                	add    %edx,%eax
  1014d9:	0f b6 00             	movzbl (%eax),%eax
  1014dc:	0f b6 c0             	movzbl %al,%eax
  1014df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014e2:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e7:	83 e0 08             	and    $0x8,%eax
  1014ea:	85 c0                	test   %eax,%eax
  1014ec:	74 22                	je     101510 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014ee:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014f2:	7e 0c                	jle    101500 <kbd_proc_data+0x13e>
  1014f4:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014f8:	7f 06                	jg     101500 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014fa:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014fe:	eb 10                	jmp    101510 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  101500:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101504:	7e 0a                	jle    101510 <kbd_proc_data+0x14e>
  101506:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10150a:	7f 04                	jg     101510 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  10150c:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101510:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101515:	f7 d0                	not    %eax
  101517:	83 e0 06             	and    $0x6,%eax
  10151a:	85 c0                	test   %eax,%eax
  10151c:	75 28                	jne    101546 <kbd_proc_data+0x184>
  10151e:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101525:	75 1f                	jne    101546 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  101527:	c7 04 24 1d 37 10 00 	movl   $0x10371d,(%esp)
  10152e:	e8 e4 ed ff ff       	call   100317 <cprintf>
  101533:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101539:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10153d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101541:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101545:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101546:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101549:	c9                   	leave  
  10154a:	c3                   	ret    

0010154b <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10154b:	55                   	push   %ebp
  10154c:	89 e5                	mov    %esp,%ebp
  10154e:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101551:	c7 04 24 c2 13 10 00 	movl   $0x1013c2,(%esp)
  101558:	e8 a6 fd ff ff       	call   101303 <cons_intr>
}
  10155d:	c9                   	leave  
  10155e:	c3                   	ret    

0010155f <kbd_init>:

static void
kbd_init(void) {
  10155f:	55                   	push   %ebp
  101560:	89 e5                	mov    %esp,%ebp
  101562:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101565:	e8 e1 ff ff ff       	call   10154b <kbd_intr>
    pic_enable(IRQ_KBD);
  10156a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101571:	e8 17 01 00 00       	call   10168d <pic_enable>
}
  101576:	c9                   	leave  
  101577:	c3                   	ret    

00101578 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101578:	55                   	push   %ebp
  101579:	89 e5                	mov    %esp,%ebp
  10157b:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10157e:	e8 93 f8 ff ff       	call   100e16 <cga_init>
    serial_init();
  101583:	e8 74 f9 ff ff       	call   100efc <serial_init>
    kbd_init();
  101588:	e8 d2 ff ff ff       	call   10155f <kbd_init>
    if (!serial_exists) {
  10158d:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101592:	85 c0                	test   %eax,%eax
  101594:	75 0c                	jne    1015a2 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101596:	c7 04 24 29 37 10 00 	movl   $0x103729,(%esp)
  10159d:	e8 75 ed ff ff       	call   100317 <cprintf>
    }
}
  1015a2:	c9                   	leave  
  1015a3:	c3                   	ret    

001015a4 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015a4:	55                   	push   %ebp
  1015a5:	89 e5                	mov    %esp,%ebp
  1015a7:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ad:	89 04 24             	mov    %eax,(%esp)
  1015b0:	e8 a3 fa ff ff       	call   101058 <lpt_putc>
    cga_putc(c);
  1015b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b8:	89 04 24             	mov    %eax,(%esp)
  1015bb:	e8 d7 fa ff ff       	call   101097 <cga_putc>
    serial_putc(c);
  1015c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c3:	89 04 24             	mov    %eax,(%esp)
  1015c6:	e8 f9 fc ff ff       	call   1012c4 <serial_putc>
}
  1015cb:	c9                   	leave  
  1015cc:	c3                   	ret    

001015cd <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015cd:	55                   	push   %ebp
  1015ce:	89 e5                	mov    %esp,%ebp
  1015d0:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015d3:	e8 cd fd ff ff       	call   1013a5 <serial_intr>
    kbd_intr();
  1015d8:	e8 6e ff ff ff       	call   10154b <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015dd:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015e3:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015e8:	39 c2                	cmp    %eax,%edx
  1015ea:	74 36                	je     101622 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015ec:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015f1:	8d 50 01             	lea    0x1(%eax),%edx
  1015f4:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015fa:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101601:	0f b6 c0             	movzbl %al,%eax
  101604:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101607:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10160c:	3d 00 02 00 00       	cmp    $0x200,%eax
  101611:	75 0a                	jne    10161d <cons_getc+0x50>
            cons.rpos = 0;
  101613:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10161a:	00 00 00 
        }
        return c;
  10161d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101620:	eb 05                	jmp    101627 <cons_getc+0x5a>
    }
    return 0;
  101622:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101627:	c9                   	leave  
  101628:	c3                   	ret    

00101629 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101629:	55                   	push   %ebp
  10162a:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10162c:	fb                   	sti    
    sti();
}
  10162d:	5d                   	pop    %ebp
  10162e:	c3                   	ret    

0010162f <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10162f:	55                   	push   %ebp
  101630:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101632:	fa                   	cli    
    cli();
}
  101633:	5d                   	pop    %ebp
  101634:	c3                   	ret    

00101635 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101635:	55                   	push   %ebp
  101636:	89 e5                	mov    %esp,%ebp
  101638:	83 ec 14             	sub    $0x14,%esp
  10163b:	8b 45 08             	mov    0x8(%ebp),%eax
  10163e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101642:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101646:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10164c:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101651:	85 c0                	test   %eax,%eax
  101653:	74 36                	je     10168b <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101655:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101659:	0f b6 c0             	movzbl %al,%eax
  10165c:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101662:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101665:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101669:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10166d:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10166e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101672:	66 c1 e8 08          	shr    $0x8,%ax
  101676:	0f b6 c0             	movzbl %al,%eax
  101679:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  10167f:	88 45 f9             	mov    %al,-0x7(%ebp)
  101682:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101686:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10168a:	ee                   	out    %al,(%dx)
    }
}
  10168b:	c9                   	leave  
  10168c:	c3                   	ret    

0010168d <pic_enable>:

void
pic_enable(unsigned int irq) {
  10168d:	55                   	push   %ebp
  10168e:	89 e5                	mov    %esp,%ebp
  101690:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101693:	8b 45 08             	mov    0x8(%ebp),%eax
  101696:	ba 01 00 00 00       	mov    $0x1,%edx
  10169b:	89 c1                	mov    %eax,%ecx
  10169d:	d3 e2                	shl    %cl,%edx
  10169f:	89 d0                	mov    %edx,%eax
  1016a1:	f7 d0                	not    %eax
  1016a3:	89 c2                	mov    %eax,%edx
  1016a5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016ac:	21 d0                	and    %edx,%eax
  1016ae:	0f b7 c0             	movzwl %ax,%eax
  1016b1:	89 04 24             	mov    %eax,(%esp)
  1016b4:	e8 7c ff ff ff       	call   101635 <pic_setmask>
}
  1016b9:	c9                   	leave  
  1016ba:	c3                   	ret    

001016bb <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016bb:	55                   	push   %ebp
  1016bc:	89 e5                	mov    %esp,%ebp
  1016be:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016c1:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016c8:	00 00 00 
  1016cb:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016d1:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016d5:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016d9:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016dd:	ee                   	out    %al,(%dx)
  1016de:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016e4:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016e8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016ec:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016f0:	ee                   	out    %al,(%dx)
  1016f1:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016f7:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016fb:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016ff:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101703:	ee                   	out    %al,(%dx)
  101704:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  10170a:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  10170e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101712:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101716:	ee                   	out    %al,(%dx)
  101717:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  10171d:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101721:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101725:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101729:	ee                   	out    %al,(%dx)
  10172a:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101730:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101734:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101738:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10173c:	ee                   	out    %al,(%dx)
  10173d:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101743:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  101747:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10174b:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10174f:	ee                   	out    %al,(%dx)
  101750:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101756:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10175a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10175e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101762:	ee                   	out    %al,(%dx)
  101763:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101769:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  10176d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101771:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101775:	ee                   	out    %al,(%dx)
  101776:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10177c:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101780:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101784:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101788:	ee                   	out    %al,(%dx)
  101789:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  10178f:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101793:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101797:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10179b:	ee                   	out    %al,(%dx)
  10179c:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017a2:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  1017a6:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017aa:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017ae:	ee                   	out    %al,(%dx)
  1017af:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017b5:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017b9:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017bd:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017c1:	ee                   	out    %al,(%dx)
  1017c2:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017c8:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017cc:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017d0:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017d4:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017d5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017dc:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017e0:	74 12                	je     1017f4 <pic_init+0x139>
        pic_setmask(irq_mask);
  1017e2:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017e9:	0f b7 c0             	movzwl %ax,%eax
  1017ec:	89 04 24             	mov    %eax,(%esp)
  1017ef:	e8 41 fe ff ff       	call   101635 <pic_setmask>
    }
}
  1017f4:	c9                   	leave  
  1017f5:	c3                   	ret    

001017f6 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017f6:	55                   	push   %ebp
  1017f7:	89 e5                	mov    %esp,%ebp
  1017f9:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017fc:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101803:	00 
  101804:	c7 04 24 60 37 10 00 	movl   $0x103760,(%esp)
  10180b:	e8 07 eb ff ff       	call   100317 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101810:	c9                   	leave  
  101811:	c3                   	ret    

00101812 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101812:	55                   	push   %ebp
  101813:	89 e5                	mov    %esp,%ebp
  101815:	83 ec 10             	sub    $0x10,%esp
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	//gate, istrap, sel, off, dpl
	int i;
	for(i=0; i < 256; i++)
  101818:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10181f:	e9 c3 00 00 00       	jmp    1018e7 <idt_init+0xd5>
		SETGATE(idt[i],0,GD_KTEXT,__vectors[i],0);
  101824:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101827:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10182e:	89 c2                	mov    %eax,%edx
  101830:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101833:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10183a:	00 
  10183b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183e:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101845:	00 08 00 
  101848:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184b:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101852:	00 
  101853:	83 e2 e0             	and    $0xffffffe0,%edx
  101856:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10185d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101860:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101867:	00 
  101868:	83 e2 1f             	and    $0x1f,%edx
  10186b:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101872:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101875:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10187c:	00 
  10187d:	83 e2 f0             	and    $0xfffffff0,%edx
  101880:	83 ca 0e             	or     $0xe,%edx
  101883:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10188a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188d:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101894:	00 
  101895:	83 e2 ef             	and    $0xffffffef,%edx
  101898:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10189f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a2:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018a9:	00 
  1018aa:	83 e2 9f             	and    $0xffffff9f,%edx
  1018ad:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b7:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018be:	00 
  1018bf:	83 ca 80             	or     $0xffffff80,%edx
  1018c2:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cc:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018d3:	c1 e8 10             	shr    $0x10,%eax
  1018d6:	89 c2                	mov    %eax,%edx
  1018d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018db:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018e2:	00 
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	//gate, istrap, sel, off, dpl
	int i;
	for(i=0; i < 256; i++)
  1018e3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018e7:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1018ee:	0f 8e 30 ff ff ff    	jle    101824 <idt_init+0x12>
  1018f4:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1018fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1018fe:	0f 01 18             	lidtl  (%eax)
		SETGATE(idt[i],0,GD_KTEXT,__vectors[i],0);
	lidt(&idt_pd);

}
  101901:	c9                   	leave  
  101902:	c3                   	ret    

00101903 <trapname>:

static const char *
trapname(int trapno) {
  101903:	55                   	push   %ebp
  101904:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101906:	8b 45 08             	mov    0x8(%ebp),%eax
  101909:	83 f8 13             	cmp    $0x13,%eax
  10190c:	77 0c                	ja     10191a <trapname+0x17>
        return excnames[trapno];
  10190e:	8b 45 08             	mov    0x8(%ebp),%eax
  101911:	8b 04 85 c0 3a 10 00 	mov    0x103ac0(,%eax,4),%eax
  101918:	eb 18                	jmp    101932 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10191a:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10191e:	7e 0d                	jle    10192d <trapname+0x2a>
  101920:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101924:	7f 07                	jg     10192d <trapname+0x2a>
        return "Hardware Interrupt";
  101926:	b8 6a 37 10 00       	mov    $0x10376a,%eax
  10192b:	eb 05                	jmp    101932 <trapname+0x2f>
    }
    return "(unknown trap)";
  10192d:	b8 7d 37 10 00       	mov    $0x10377d,%eax
}
  101932:	5d                   	pop    %ebp
  101933:	c3                   	ret    

00101934 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101934:	55                   	push   %ebp
  101935:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101937:	8b 45 08             	mov    0x8(%ebp),%eax
  10193a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10193e:	66 83 f8 08          	cmp    $0x8,%ax
  101942:	0f 94 c0             	sete   %al
  101945:	0f b6 c0             	movzbl %al,%eax
}
  101948:	5d                   	pop    %ebp
  101949:	c3                   	ret    

0010194a <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10194a:	55                   	push   %ebp
  10194b:	89 e5                	mov    %esp,%ebp
  10194d:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101950:	8b 45 08             	mov    0x8(%ebp),%eax
  101953:	89 44 24 04          	mov    %eax,0x4(%esp)
  101957:	c7 04 24 be 37 10 00 	movl   $0x1037be,(%esp)
  10195e:	e8 b4 e9 ff ff       	call   100317 <cprintf>
    print_regs(&tf->tf_regs);
  101963:	8b 45 08             	mov    0x8(%ebp),%eax
  101966:	89 04 24             	mov    %eax,(%esp)
  101969:	e8 a1 01 00 00       	call   101b0f <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  10196e:	8b 45 08             	mov    0x8(%ebp),%eax
  101971:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101975:	0f b7 c0             	movzwl %ax,%eax
  101978:	89 44 24 04          	mov    %eax,0x4(%esp)
  10197c:	c7 04 24 cf 37 10 00 	movl   $0x1037cf,(%esp)
  101983:	e8 8f e9 ff ff       	call   100317 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101988:	8b 45 08             	mov    0x8(%ebp),%eax
  10198b:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  10198f:	0f b7 c0             	movzwl %ax,%eax
  101992:	89 44 24 04          	mov    %eax,0x4(%esp)
  101996:	c7 04 24 e2 37 10 00 	movl   $0x1037e2,(%esp)
  10199d:	e8 75 e9 ff ff       	call   100317 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1019a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a5:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1019a9:	0f b7 c0             	movzwl %ax,%eax
  1019ac:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019b0:	c7 04 24 f5 37 10 00 	movl   $0x1037f5,(%esp)
  1019b7:	e8 5b e9 ff ff       	call   100317 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1019bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bf:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1019c3:	0f b7 c0             	movzwl %ax,%eax
  1019c6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ca:	c7 04 24 08 38 10 00 	movl   $0x103808,(%esp)
  1019d1:	e8 41 e9 ff ff       	call   100317 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1019d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d9:	8b 40 30             	mov    0x30(%eax),%eax
  1019dc:	89 04 24             	mov    %eax,(%esp)
  1019df:	e8 1f ff ff ff       	call   101903 <trapname>
  1019e4:	8b 55 08             	mov    0x8(%ebp),%edx
  1019e7:	8b 52 30             	mov    0x30(%edx),%edx
  1019ea:	89 44 24 08          	mov    %eax,0x8(%esp)
  1019ee:	89 54 24 04          	mov    %edx,0x4(%esp)
  1019f2:	c7 04 24 1b 38 10 00 	movl   $0x10381b,(%esp)
  1019f9:	e8 19 e9 ff ff       	call   100317 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  1019fe:	8b 45 08             	mov    0x8(%ebp),%eax
  101a01:	8b 40 34             	mov    0x34(%eax),%eax
  101a04:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a08:	c7 04 24 2d 38 10 00 	movl   $0x10382d,(%esp)
  101a0f:	e8 03 e9 ff ff       	call   100317 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a14:	8b 45 08             	mov    0x8(%ebp),%eax
  101a17:	8b 40 38             	mov    0x38(%eax),%eax
  101a1a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a1e:	c7 04 24 3c 38 10 00 	movl   $0x10383c,(%esp)
  101a25:	e8 ed e8 ff ff       	call   100317 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a31:	0f b7 c0             	movzwl %ax,%eax
  101a34:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a38:	c7 04 24 4b 38 10 00 	movl   $0x10384b,(%esp)
  101a3f:	e8 d3 e8 ff ff       	call   100317 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a44:	8b 45 08             	mov    0x8(%ebp),%eax
  101a47:	8b 40 40             	mov    0x40(%eax),%eax
  101a4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a4e:	c7 04 24 5e 38 10 00 	movl   $0x10385e,(%esp)
  101a55:	e8 bd e8 ff ff       	call   100317 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a61:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a68:	eb 3e                	jmp    101aa8 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6d:	8b 50 40             	mov    0x40(%eax),%edx
  101a70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a73:	21 d0                	and    %edx,%eax
  101a75:	85 c0                	test   %eax,%eax
  101a77:	74 28                	je     101aa1 <print_trapframe+0x157>
  101a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a7c:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a83:	85 c0                	test   %eax,%eax
  101a85:	74 1a                	je     101aa1 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101a87:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a8a:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a91:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a95:	c7 04 24 6d 38 10 00 	movl   $0x10386d,(%esp)
  101a9c:	e8 76 e8 ff ff       	call   100317 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101aa1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101aa5:	d1 65 f0             	shll   -0x10(%ebp)
  101aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101aab:	83 f8 17             	cmp    $0x17,%eax
  101aae:	76 ba                	jbe    101a6a <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101ab0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab3:	8b 40 40             	mov    0x40(%eax),%eax
  101ab6:	25 00 30 00 00       	and    $0x3000,%eax
  101abb:	c1 e8 0c             	shr    $0xc,%eax
  101abe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac2:	c7 04 24 71 38 10 00 	movl   $0x103871,(%esp)
  101ac9:	e8 49 e8 ff ff       	call   100317 <cprintf>

    if (!trap_in_kernel(tf)) {
  101ace:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad1:	89 04 24             	mov    %eax,(%esp)
  101ad4:	e8 5b fe ff ff       	call   101934 <trap_in_kernel>
  101ad9:	85 c0                	test   %eax,%eax
  101adb:	75 30                	jne    101b0d <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101add:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae0:	8b 40 44             	mov    0x44(%eax),%eax
  101ae3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ae7:	c7 04 24 7a 38 10 00 	movl   $0x10387a,(%esp)
  101aee:	e8 24 e8 ff ff       	call   100317 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101af3:	8b 45 08             	mov    0x8(%ebp),%eax
  101af6:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101afa:	0f b7 c0             	movzwl %ax,%eax
  101afd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b01:	c7 04 24 89 38 10 00 	movl   $0x103889,(%esp)
  101b08:	e8 0a e8 ff ff       	call   100317 <cprintf>
    }
}
  101b0d:	c9                   	leave  
  101b0e:	c3                   	ret    

00101b0f <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b0f:	55                   	push   %ebp
  101b10:	89 e5                	mov    %esp,%ebp
  101b12:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b15:	8b 45 08             	mov    0x8(%ebp),%eax
  101b18:	8b 00                	mov    (%eax),%eax
  101b1a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1e:	c7 04 24 9c 38 10 00 	movl   $0x10389c,(%esp)
  101b25:	e8 ed e7 ff ff       	call   100317 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2d:	8b 40 04             	mov    0x4(%eax),%eax
  101b30:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b34:	c7 04 24 ab 38 10 00 	movl   $0x1038ab,(%esp)
  101b3b:	e8 d7 e7 ff ff       	call   100317 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b40:	8b 45 08             	mov    0x8(%ebp),%eax
  101b43:	8b 40 08             	mov    0x8(%eax),%eax
  101b46:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b4a:	c7 04 24 ba 38 10 00 	movl   $0x1038ba,(%esp)
  101b51:	e8 c1 e7 ff ff       	call   100317 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b56:	8b 45 08             	mov    0x8(%ebp),%eax
  101b59:	8b 40 0c             	mov    0xc(%eax),%eax
  101b5c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b60:	c7 04 24 c9 38 10 00 	movl   $0x1038c9,(%esp)
  101b67:	e8 ab e7 ff ff       	call   100317 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6f:	8b 40 10             	mov    0x10(%eax),%eax
  101b72:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b76:	c7 04 24 d8 38 10 00 	movl   $0x1038d8,(%esp)
  101b7d:	e8 95 e7 ff ff       	call   100317 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b82:	8b 45 08             	mov    0x8(%ebp),%eax
  101b85:	8b 40 14             	mov    0x14(%eax),%eax
  101b88:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b8c:	c7 04 24 e7 38 10 00 	movl   $0x1038e7,(%esp)
  101b93:	e8 7f e7 ff ff       	call   100317 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101b98:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9b:	8b 40 18             	mov    0x18(%eax),%eax
  101b9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba2:	c7 04 24 f6 38 10 00 	movl   $0x1038f6,(%esp)
  101ba9:	e8 69 e7 ff ff       	call   100317 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101bae:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb1:	8b 40 1c             	mov    0x1c(%eax),%eax
  101bb4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb8:	c7 04 24 05 39 10 00 	movl   $0x103905,(%esp)
  101bbf:	e8 53 e7 ff ff       	call   100317 <cprintf>
}
  101bc4:	c9                   	leave  
  101bc5:	c3                   	ret    

00101bc6 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101bc6:	55                   	push   %ebp
  101bc7:	89 e5                	mov    %esp,%ebp
  101bc9:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101bcc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcf:	8b 40 30             	mov    0x30(%eax),%eax
  101bd2:	83 f8 2f             	cmp    $0x2f,%eax
  101bd5:	77 1d                	ja     101bf4 <trap_dispatch+0x2e>
  101bd7:	83 f8 2e             	cmp    $0x2e,%eax
  101bda:	0f 83 f2 00 00 00    	jae    101cd2 <trap_dispatch+0x10c>
  101be0:	83 f8 21             	cmp    $0x21,%eax
  101be3:	74 73                	je     101c58 <trap_dispatch+0x92>
  101be5:	83 f8 24             	cmp    $0x24,%eax
  101be8:	74 48                	je     101c32 <trap_dispatch+0x6c>
  101bea:	83 f8 20             	cmp    $0x20,%eax
  101bed:	74 13                	je     101c02 <trap_dispatch+0x3c>
  101bef:	e9 a6 00 00 00       	jmp    101c9a <trap_dispatch+0xd4>
  101bf4:	83 e8 78             	sub    $0x78,%eax
  101bf7:	83 f8 01             	cmp    $0x1,%eax
  101bfa:	0f 87 9a 00 00 00    	ja     101c9a <trap_dispatch+0xd4>
  101c00:	eb 7c                	jmp    101c7e <trap_dispatch+0xb8>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
    	ticks++;
  101c02:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c07:	83 c0 01             	add    $0x1,%eax
  101c0a:	a3 08 f9 10 00       	mov    %eax,0x10f908
    	if(ticks == TICK_NUM){
  101c0f:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c14:	83 f8 64             	cmp    $0x64,%eax
  101c17:	75 14                	jne    101c2d <trap_dispatch+0x67>
    		ticks =0;
  101c19:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101c20:	00 00 00 
    		print_ticks();
  101c23:	e8 ce fb ff ff       	call   1017f6 <print_ticks>
    	}
        break;
  101c28:	e9 a6 00 00 00       	jmp    101cd3 <trap_dispatch+0x10d>
  101c2d:	e9 a1 00 00 00       	jmp    101cd3 <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c32:	e8 96 f9 ff ff       	call   1015cd <cons_getc>
  101c37:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c3a:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c3e:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c42:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c46:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c4a:	c7 04 24 14 39 10 00 	movl   $0x103914,(%esp)
  101c51:	e8 c1 e6 ff ff       	call   100317 <cprintf>
        break;
  101c56:	eb 7b                	jmp    101cd3 <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c58:	e8 70 f9 ff ff       	call   1015cd <cons_getc>
  101c5d:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c60:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c64:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c68:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c6c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c70:	c7 04 24 26 39 10 00 	movl   $0x103926,(%esp)
  101c77:	e8 9b e6 ff ff       	call   100317 <cprintf>
        break;
  101c7c:	eb 55                	jmp    101cd3 <trap_dispatch+0x10d>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101c7e:	c7 44 24 08 35 39 10 	movl   $0x103935,0x8(%esp)
  101c85:	00 
  101c86:	c7 44 24 04 ae 00 00 	movl   $0xae,0x4(%esp)
  101c8d:	00 
  101c8e:	c7 04 24 45 39 10 00 	movl   $0x103945,(%esp)
  101c95:	e8 15 f0 ff ff       	call   100caf <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101c9a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c9d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ca1:	0f b7 c0             	movzwl %ax,%eax
  101ca4:	83 e0 03             	and    $0x3,%eax
  101ca7:	85 c0                	test   %eax,%eax
  101ca9:	75 28                	jne    101cd3 <trap_dispatch+0x10d>
            print_trapframe(tf);
  101cab:	8b 45 08             	mov    0x8(%ebp),%eax
  101cae:	89 04 24             	mov    %eax,(%esp)
  101cb1:	e8 94 fc ff ff       	call   10194a <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101cb6:	c7 44 24 08 56 39 10 	movl   $0x103956,0x8(%esp)
  101cbd:	00 
  101cbe:	c7 44 24 04 b8 00 00 	movl   $0xb8,0x4(%esp)
  101cc5:	00 
  101cc6:	c7 04 24 45 39 10 00 	movl   $0x103945,(%esp)
  101ccd:	e8 dd ef ff ff       	call   100caf <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101cd2:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101cd3:	c9                   	leave  
  101cd4:	c3                   	ret    

00101cd5 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101cd5:	55                   	push   %ebp
  101cd6:	89 e5                	mov    %esp,%ebp
  101cd8:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101cdb:	8b 45 08             	mov    0x8(%ebp),%eax
  101cde:	89 04 24             	mov    %eax,(%esp)
  101ce1:	e8 e0 fe ff ff       	call   101bc6 <trap_dispatch>
}
  101ce6:	c9                   	leave  
  101ce7:	c3                   	ret    

00101ce8 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101ce8:	1e                   	push   %ds
    pushl %es
  101ce9:	06                   	push   %es
    pushl %fs
  101cea:	0f a0                	push   %fs
    pushl %gs
  101cec:	0f a8                	push   %gs
    pushal
  101cee:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101cef:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101cf4:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101cf6:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101cf8:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101cf9:	e8 d7 ff ff ff       	call   101cd5 <trap>

    # pop the pushed stack pointer
    popl %esp
  101cfe:	5c                   	pop    %esp

00101cff <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101cff:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101d00:	0f a9                	pop    %gs
    popl %fs
  101d02:	0f a1                	pop    %fs
    popl %es
  101d04:	07                   	pop    %es
    popl %ds
  101d05:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101d06:	83 c4 08             	add    $0x8,%esp
    iret
  101d09:	cf                   	iret   

00101d0a <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d0a:	6a 00                	push   $0x0
  pushl $0
  101d0c:	6a 00                	push   $0x0
  jmp __alltraps
  101d0e:	e9 d5 ff ff ff       	jmp    101ce8 <__alltraps>

00101d13 <vector1>:
.globl vector1
vector1:
  pushl $0
  101d13:	6a 00                	push   $0x0
  pushl $1
  101d15:	6a 01                	push   $0x1
  jmp __alltraps
  101d17:	e9 cc ff ff ff       	jmp    101ce8 <__alltraps>

00101d1c <vector2>:
.globl vector2
vector2:
  pushl $0
  101d1c:	6a 00                	push   $0x0
  pushl $2
  101d1e:	6a 02                	push   $0x2
  jmp __alltraps
  101d20:	e9 c3 ff ff ff       	jmp    101ce8 <__alltraps>

00101d25 <vector3>:
.globl vector3
vector3:
  pushl $0
  101d25:	6a 00                	push   $0x0
  pushl $3
  101d27:	6a 03                	push   $0x3
  jmp __alltraps
  101d29:	e9 ba ff ff ff       	jmp    101ce8 <__alltraps>

00101d2e <vector4>:
.globl vector4
vector4:
  pushl $0
  101d2e:	6a 00                	push   $0x0
  pushl $4
  101d30:	6a 04                	push   $0x4
  jmp __alltraps
  101d32:	e9 b1 ff ff ff       	jmp    101ce8 <__alltraps>

00101d37 <vector5>:
.globl vector5
vector5:
  pushl $0
  101d37:	6a 00                	push   $0x0
  pushl $5
  101d39:	6a 05                	push   $0x5
  jmp __alltraps
  101d3b:	e9 a8 ff ff ff       	jmp    101ce8 <__alltraps>

00101d40 <vector6>:
.globl vector6
vector6:
  pushl $0
  101d40:	6a 00                	push   $0x0
  pushl $6
  101d42:	6a 06                	push   $0x6
  jmp __alltraps
  101d44:	e9 9f ff ff ff       	jmp    101ce8 <__alltraps>

00101d49 <vector7>:
.globl vector7
vector7:
  pushl $0
  101d49:	6a 00                	push   $0x0
  pushl $7
  101d4b:	6a 07                	push   $0x7
  jmp __alltraps
  101d4d:	e9 96 ff ff ff       	jmp    101ce8 <__alltraps>

00101d52 <vector8>:
.globl vector8
vector8:
  pushl $8
  101d52:	6a 08                	push   $0x8
  jmp __alltraps
  101d54:	e9 8f ff ff ff       	jmp    101ce8 <__alltraps>

00101d59 <vector9>:
.globl vector9
vector9:
  pushl $9
  101d59:	6a 09                	push   $0x9
  jmp __alltraps
  101d5b:	e9 88 ff ff ff       	jmp    101ce8 <__alltraps>

00101d60 <vector10>:
.globl vector10
vector10:
  pushl $10
  101d60:	6a 0a                	push   $0xa
  jmp __alltraps
  101d62:	e9 81 ff ff ff       	jmp    101ce8 <__alltraps>

00101d67 <vector11>:
.globl vector11
vector11:
  pushl $11
  101d67:	6a 0b                	push   $0xb
  jmp __alltraps
  101d69:	e9 7a ff ff ff       	jmp    101ce8 <__alltraps>

00101d6e <vector12>:
.globl vector12
vector12:
  pushl $12
  101d6e:	6a 0c                	push   $0xc
  jmp __alltraps
  101d70:	e9 73 ff ff ff       	jmp    101ce8 <__alltraps>

00101d75 <vector13>:
.globl vector13
vector13:
  pushl $13
  101d75:	6a 0d                	push   $0xd
  jmp __alltraps
  101d77:	e9 6c ff ff ff       	jmp    101ce8 <__alltraps>

00101d7c <vector14>:
.globl vector14
vector14:
  pushl $14
  101d7c:	6a 0e                	push   $0xe
  jmp __alltraps
  101d7e:	e9 65 ff ff ff       	jmp    101ce8 <__alltraps>

00101d83 <vector15>:
.globl vector15
vector15:
  pushl $0
  101d83:	6a 00                	push   $0x0
  pushl $15
  101d85:	6a 0f                	push   $0xf
  jmp __alltraps
  101d87:	e9 5c ff ff ff       	jmp    101ce8 <__alltraps>

00101d8c <vector16>:
.globl vector16
vector16:
  pushl $0
  101d8c:	6a 00                	push   $0x0
  pushl $16
  101d8e:	6a 10                	push   $0x10
  jmp __alltraps
  101d90:	e9 53 ff ff ff       	jmp    101ce8 <__alltraps>

00101d95 <vector17>:
.globl vector17
vector17:
  pushl $17
  101d95:	6a 11                	push   $0x11
  jmp __alltraps
  101d97:	e9 4c ff ff ff       	jmp    101ce8 <__alltraps>

00101d9c <vector18>:
.globl vector18
vector18:
  pushl $0
  101d9c:	6a 00                	push   $0x0
  pushl $18
  101d9e:	6a 12                	push   $0x12
  jmp __alltraps
  101da0:	e9 43 ff ff ff       	jmp    101ce8 <__alltraps>

00101da5 <vector19>:
.globl vector19
vector19:
  pushl $0
  101da5:	6a 00                	push   $0x0
  pushl $19
  101da7:	6a 13                	push   $0x13
  jmp __alltraps
  101da9:	e9 3a ff ff ff       	jmp    101ce8 <__alltraps>

00101dae <vector20>:
.globl vector20
vector20:
  pushl $0
  101dae:	6a 00                	push   $0x0
  pushl $20
  101db0:	6a 14                	push   $0x14
  jmp __alltraps
  101db2:	e9 31 ff ff ff       	jmp    101ce8 <__alltraps>

00101db7 <vector21>:
.globl vector21
vector21:
  pushl $0
  101db7:	6a 00                	push   $0x0
  pushl $21
  101db9:	6a 15                	push   $0x15
  jmp __alltraps
  101dbb:	e9 28 ff ff ff       	jmp    101ce8 <__alltraps>

00101dc0 <vector22>:
.globl vector22
vector22:
  pushl $0
  101dc0:	6a 00                	push   $0x0
  pushl $22
  101dc2:	6a 16                	push   $0x16
  jmp __alltraps
  101dc4:	e9 1f ff ff ff       	jmp    101ce8 <__alltraps>

00101dc9 <vector23>:
.globl vector23
vector23:
  pushl $0
  101dc9:	6a 00                	push   $0x0
  pushl $23
  101dcb:	6a 17                	push   $0x17
  jmp __alltraps
  101dcd:	e9 16 ff ff ff       	jmp    101ce8 <__alltraps>

00101dd2 <vector24>:
.globl vector24
vector24:
  pushl $0
  101dd2:	6a 00                	push   $0x0
  pushl $24
  101dd4:	6a 18                	push   $0x18
  jmp __alltraps
  101dd6:	e9 0d ff ff ff       	jmp    101ce8 <__alltraps>

00101ddb <vector25>:
.globl vector25
vector25:
  pushl $0
  101ddb:	6a 00                	push   $0x0
  pushl $25
  101ddd:	6a 19                	push   $0x19
  jmp __alltraps
  101ddf:	e9 04 ff ff ff       	jmp    101ce8 <__alltraps>

00101de4 <vector26>:
.globl vector26
vector26:
  pushl $0
  101de4:	6a 00                	push   $0x0
  pushl $26
  101de6:	6a 1a                	push   $0x1a
  jmp __alltraps
  101de8:	e9 fb fe ff ff       	jmp    101ce8 <__alltraps>

00101ded <vector27>:
.globl vector27
vector27:
  pushl $0
  101ded:	6a 00                	push   $0x0
  pushl $27
  101def:	6a 1b                	push   $0x1b
  jmp __alltraps
  101df1:	e9 f2 fe ff ff       	jmp    101ce8 <__alltraps>

00101df6 <vector28>:
.globl vector28
vector28:
  pushl $0
  101df6:	6a 00                	push   $0x0
  pushl $28
  101df8:	6a 1c                	push   $0x1c
  jmp __alltraps
  101dfa:	e9 e9 fe ff ff       	jmp    101ce8 <__alltraps>

00101dff <vector29>:
.globl vector29
vector29:
  pushl $0
  101dff:	6a 00                	push   $0x0
  pushl $29
  101e01:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e03:	e9 e0 fe ff ff       	jmp    101ce8 <__alltraps>

00101e08 <vector30>:
.globl vector30
vector30:
  pushl $0
  101e08:	6a 00                	push   $0x0
  pushl $30
  101e0a:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e0c:	e9 d7 fe ff ff       	jmp    101ce8 <__alltraps>

00101e11 <vector31>:
.globl vector31
vector31:
  pushl $0
  101e11:	6a 00                	push   $0x0
  pushl $31
  101e13:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e15:	e9 ce fe ff ff       	jmp    101ce8 <__alltraps>

00101e1a <vector32>:
.globl vector32
vector32:
  pushl $0
  101e1a:	6a 00                	push   $0x0
  pushl $32
  101e1c:	6a 20                	push   $0x20
  jmp __alltraps
  101e1e:	e9 c5 fe ff ff       	jmp    101ce8 <__alltraps>

00101e23 <vector33>:
.globl vector33
vector33:
  pushl $0
  101e23:	6a 00                	push   $0x0
  pushl $33
  101e25:	6a 21                	push   $0x21
  jmp __alltraps
  101e27:	e9 bc fe ff ff       	jmp    101ce8 <__alltraps>

00101e2c <vector34>:
.globl vector34
vector34:
  pushl $0
  101e2c:	6a 00                	push   $0x0
  pushl $34
  101e2e:	6a 22                	push   $0x22
  jmp __alltraps
  101e30:	e9 b3 fe ff ff       	jmp    101ce8 <__alltraps>

00101e35 <vector35>:
.globl vector35
vector35:
  pushl $0
  101e35:	6a 00                	push   $0x0
  pushl $35
  101e37:	6a 23                	push   $0x23
  jmp __alltraps
  101e39:	e9 aa fe ff ff       	jmp    101ce8 <__alltraps>

00101e3e <vector36>:
.globl vector36
vector36:
  pushl $0
  101e3e:	6a 00                	push   $0x0
  pushl $36
  101e40:	6a 24                	push   $0x24
  jmp __alltraps
  101e42:	e9 a1 fe ff ff       	jmp    101ce8 <__alltraps>

00101e47 <vector37>:
.globl vector37
vector37:
  pushl $0
  101e47:	6a 00                	push   $0x0
  pushl $37
  101e49:	6a 25                	push   $0x25
  jmp __alltraps
  101e4b:	e9 98 fe ff ff       	jmp    101ce8 <__alltraps>

00101e50 <vector38>:
.globl vector38
vector38:
  pushl $0
  101e50:	6a 00                	push   $0x0
  pushl $38
  101e52:	6a 26                	push   $0x26
  jmp __alltraps
  101e54:	e9 8f fe ff ff       	jmp    101ce8 <__alltraps>

00101e59 <vector39>:
.globl vector39
vector39:
  pushl $0
  101e59:	6a 00                	push   $0x0
  pushl $39
  101e5b:	6a 27                	push   $0x27
  jmp __alltraps
  101e5d:	e9 86 fe ff ff       	jmp    101ce8 <__alltraps>

00101e62 <vector40>:
.globl vector40
vector40:
  pushl $0
  101e62:	6a 00                	push   $0x0
  pushl $40
  101e64:	6a 28                	push   $0x28
  jmp __alltraps
  101e66:	e9 7d fe ff ff       	jmp    101ce8 <__alltraps>

00101e6b <vector41>:
.globl vector41
vector41:
  pushl $0
  101e6b:	6a 00                	push   $0x0
  pushl $41
  101e6d:	6a 29                	push   $0x29
  jmp __alltraps
  101e6f:	e9 74 fe ff ff       	jmp    101ce8 <__alltraps>

00101e74 <vector42>:
.globl vector42
vector42:
  pushl $0
  101e74:	6a 00                	push   $0x0
  pushl $42
  101e76:	6a 2a                	push   $0x2a
  jmp __alltraps
  101e78:	e9 6b fe ff ff       	jmp    101ce8 <__alltraps>

00101e7d <vector43>:
.globl vector43
vector43:
  pushl $0
  101e7d:	6a 00                	push   $0x0
  pushl $43
  101e7f:	6a 2b                	push   $0x2b
  jmp __alltraps
  101e81:	e9 62 fe ff ff       	jmp    101ce8 <__alltraps>

00101e86 <vector44>:
.globl vector44
vector44:
  pushl $0
  101e86:	6a 00                	push   $0x0
  pushl $44
  101e88:	6a 2c                	push   $0x2c
  jmp __alltraps
  101e8a:	e9 59 fe ff ff       	jmp    101ce8 <__alltraps>

00101e8f <vector45>:
.globl vector45
vector45:
  pushl $0
  101e8f:	6a 00                	push   $0x0
  pushl $45
  101e91:	6a 2d                	push   $0x2d
  jmp __alltraps
  101e93:	e9 50 fe ff ff       	jmp    101ce8 <__alltraps>

00101e98 <vector46>:
.globl vector46
vector46:
  pushl $0
  101e98:	6a 00                	push   $0x0
  pushl $46
  101e9a:	6a 2e                	push   $0x2e
  jmp __alltraps
  101e9c:	e9 47 fe ff ff       	jmp    101ce8 <__alltraps>

00101ea1 <vector47>:
.globl vector47
vector47:
  pushl $0
  101ea1:	6a 00                	push   $0x0
  pushl $47
  101ea3:	6a 2f                	push   $0x2f
  jmp __alltraps
  101ea5:	e9 3e fe ff ff       	jmp    101ce8 <__alltraps>

00101eaa <vector48>:
.globl vector48
vector48:
  pushl $0
  101eaa:	6a 00                	push   $0x0
  pushl $48
  101eac:	6a 30                	push   $0x30
  jmp __alltraps
  101eae:	e9 35 fe ff ff       	jmp    101ce8 <__alltraps>

00101eb3 <vector49>:
.globl vector49
vector49:
  pushl $0
  101eb3:	6a 00                	push   $0x0
  pushl $49
  101eb5:	6a 31                	push   $0x31
  jmp __alltraps
  101eb7:	e9 2c fe ff ff       	jmp    101ce8 <__alltraps>

00101ebc <vector50>:
.globl vector50
vector50:
  pushl $0
  101ebc:	6a 00                	push   $0x0
  pushl $50
  101ebe:	6a 32                	push   $0x32
  jmp __alltraps
  101ec0:	e9 23 fe ff ff       	jmp    101ce8 <__alltraps>

00101ec5 <vector51>:
.globl vector51
vector51:
  pushl $0
  101ec5:	6a 00                	push   $0x0
  pushl $51
  101ec7:	6a 33                	push   $0x33
  jmp __alltraps
  101ec9:	e9 1a fe ff ff       	jmp    101ce8 <__alltraps>

00101ece <vector52>:
.globl vector52
vector52:
  pushl $0
  101ece:	6a 00                	push   $0x0
  pushl $52
  101ed0:	6a 34                	push   $0x34
  jmp __alltraps
  101ed2:	e9 11 fe ff ff       	jmp    101ce8 <__alltraps>

00101ed7 <vector53>:
.globl vector53
vector53:
  pushl $0
  101ed7:	6a 00                	push   $0x0
  pushl $53
  101ed9:	6a 35                	push   $0x35
  jmp __alltraps
  101edb:	e9 08 fe ff ff       	jmp    101ce8 <__alltraps>

00101ee0 <vector54>:
.globl vector54
vector54:
  pushl $0
  101ee0:	6a 00                	push   $0x0
  pushl $54
  101ee2:	6a 36                	push   $0x36
  jmp __alltraps
  101ee4:	e9 ff fd ff ff       	jmp    101ce8 <__alltraps>

00101ee9 <vector55>:
.globl vector55
vector55:
  pushl $0
  101ee9:	6a 00                	push   $0x0
  pushl $55
  101eeb:	6a 37                	push   $0x37
  jmp __alltraps
  101eed:	e9 f6 fd ff ff       	jmp    101ce8 <__alltraps>

00101ef2 <vector56>:
.globl vector56
vector56:
  pushl $0
  101ef2:	6a 00                	push   $0x0
  pushl $56
  101ef4:	6a 38                	push   $0x38
  jmp __alltraps
  101ef6:	e9 ed fd ff ff       	jmp    101ce8 <__alltraps>

00101efb <vector57>:
.globl vector57
vector57:
  pushl $0
  101efb:	6a 00                	push   $0x0
  pushl $57
  101efd:	6a 39                	push   $0x39
  jmp __alltraps
  101eff:	e9 e4 fd ff ff       	jmp    101ce8 <__alltraps>

00101f04 <vector58>:
.globl vector58
vector58:
  pushl $0
  101f04:	6a 00                	push   $0x0
  pushl $58
  101f06:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f08:	e9 db fd ff ff       	jmp    101ce8 <__alltraps>

00101f0d <vector59>:
.globl vector59
vector59:
  pushl $0
  101f0d:	6a 00                	push   $0x0
  pushl $59
  101f0f:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f11:	e9 d2 fd ff ff       	jmp    101ce8 <__alltraps>

00101f16 <vector60>:
.globl vector60
vector60:
  pushl $0
  101f16:	6a 00                	push   $0x0
  pushl $60
  101f18:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f1a:	e9 c9 fd ff ff       	jmp    101ce8 <__alltraps>

00101f1f <vector61>:
.globl vector61
vector61:
  pushl $0
  101f1f:	6a 00                	push   $0x0
  pushl $61
  101f21:	6a 3d                	push   $0x3d
  jmp __alltraps
  101f23:	e9 c0 fd ff ff       	jmp    101ce8 <__alltraps>

00101f28 <vector62>:
.globl vector62
vector62:
  pushl $0
  101f28:	6a 00                	push   $0x0
  pushl $62
  101f2a:	6a 3e                	push   $0x3e
  jmp __alltraps
  101f2c:	e9 b7 fd ff ff       	jmp    101ce8 <__alltraps>

00101f31 <vector63>:
.globl vector63
vector63:
  pushl $0
  101f31:	6a 00                	push   $0x0
  pushl $63
  101f33:	6a 3f                	push   $0x3f
  jmp __alltraps
  101f35:	e9 ae fd ff ff       	jmp    101ce8 <__alltraps>

00101f3a <vector64>:
.globl vector64
vector64:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $64
  101f3c:	6a 40                	push   $0x40
  jmp __alltraps
  101f3e:	e9 a5 fd ff ff       	jmp    101ce8 <__alltraps>

00101f43 <vector65>:
.globl vector65
vector65:
  pushl $0
  101f43:	6a 00                	push   $0x0
  pushl $65
  101f45:	6a 41                	push   $0x41
  jmp __alltraps
  101f47:	e9 9c fd ff ff       	jmp    101ce8 <__alltraps>

00101f4c <vector66>:
.globl vector66
vector66:
  pushl $0
  101f4c:	6a 00                	push   $0x0
  pushl $66
  101f4e:	6a 42                	push   $0x42
  jmp __alltraps
  101f50:	e9 93 fd ff ff       	jmp    101ce8 <__alltraps>

00101f55 <vector67>:
.globl vector67
vector67:
  pushl $0
  101f55:	6a 00                	push   $0x0
  pushl $67
  101f57:	6a 43                	push   $0x43
  jmp __alltraps
  101f59:	e9 8a fd ff ff       	jmp    101ce8 <__alltraps>

00101f5e <vector68>:
.globl vector68
vector68:
  pushl $0
  101f5e:	6a 00                	push   $0x0
  pushl $68
  101f60:	6a 44                	push   $0x44
  jmp __alltraps
  101f62:	e9 81 fd ff ff       	jmp    101ce8 <__alltraps>

00101f67 <vector69>:
.globl vector69
vector69:
  pushl $0
  101f67:	6a 00                	push   $0x0
  pushl $69
  101f69:	6a 45                	push   $0x45
  jmp __alltraps
  101f6b:	e9 78 fd ff ff       	jmp    101ce8 <__alltraps>

00101f70 <vector70>:
.globl vector70
vector70:
  pushl $0
  101f70:	6a 00                	push   $0x0
  pushl $70
  101f72:	6a 46                	push   $0x46
  jmp __alltraps
  101f74:	e9 6f fd ff ff       	jmp    101ce8 <__alltraps>

00101f79 <vector71>:
.globl vector71
vector71:
  pushl $0
  101f79:	6a 00                	push   $0x0
  pushl $71
  101f7b:	6a 47                	push   $0x47
  jmp __alltraps
  101f7d:	e9 66 fd ff ff       	jmp    101ce8 <__alltraps>

00101f82 <vector72>:
.globl vector72
vector72:
  pushl $0
  101f82:	6a 00                	push   $0x0
  pushl $72
  101f84:	6a 48                	push   $0x48
  jmp __alltraps
  101f86:	e9 5d fd ff ff       	jmp    101ce8 <__alltraps>

00101f8b <vector73>:
.globl vector73
vector73:
  pushl $0
  101f8b:	6a 00                	push   $0x0
  pushl $73
  101f8d:	6a 49                	push   $0x49
  jmp __alltraps
  101f8f:	e9 54 fd ff ff       	jmp    101ce8 <__alltraps>

00101f94 <vector74>:
.globl vector74
vector74:
  pushl $0
  101f94:	6a 00                	push   $0x0
  pushl $74
  101f96:	6a 4a                	push   $0x4a
  jmp __alltraps
  101f98:	e9 4b fd ff ff       	jmp    101ce8 <__alltraps>

00101f9d <vector75>:
.globl vector75
vector75:
  pushl $0
  101f9d:	6a 00                	push   $0x0
  pushl $75
  101f9f:	6a 4b                	push   $0x4b
  jmp __alltraps
  101fa1:	e9 42 fd ff ff       	jmp    101ce8 <__alltraps>

00101fa6 <vector76>:
.globl vector76
vector76:
  pushl $0
  101fa6:	6a 00                	push   $0x0
  pushl $76
  101fa8:	6a 4c                	push   $0x4c
  jmp __alltraps
  101faa:	e9 39 fd ff ff       	jmp    101ce8 <__alltraps>

00101faf <vector77>:
.globl vector77
vector77:
  pushl $0
  101faf:	6a 00                	push   $0x0
  pushl $77
  101fb1:	6a 4d                	push   $0x4d
  jmp __alltraps
  101fb3:	e9 30 fd ff ff       	jmp    101ce8 <__alltraps>

00101fb8 <vector78>:
.globl vector78
vector78:
  pushl $0
  101fb8:	6a 00                	push   $0x0
  pushl $78
  101fba:	6a 4e                	push   $0x4e
  jmp __alltraps
  101fbc:	e9 27 fd ff ff       	jmp    101ce8 <__alltraps>

00101fc1 <vector79>:
.globl vector79
vector79:
  pushl $0
  101fc1:	6a 00                	push   $0x0
  pushl $79
  101fc3:	6a 4f                	push   $0x4f
  jmp __alltraps
  101fc5:	e9 1e fd ff ff       	jmp    101ce8 <__alltraps>

00101fca <vector80>:
.globl vector80
vector80:
  pushl $0
  101fca:	6a 00                	push   $0x0
  pushl $80
  101fcc:	6a 50                	push   $0x50
  jmp __alltraps
  101fce:	e9 15 fd ff ff       	jmp    101ce8 <__alltraps>

00101fd3 <vector81>:
.globl vector81
vector81:
  pushl $0
  101fd3:	6a 00                	push   $0x0
  pushl $81
  101fd5:	6a 51                	push   $0x51
  jmp __alltraps
  101fd7:	e9 0c fd ff ff       	jmp    101ce8 <__alltraps>

00101fdc <vector82>:
.globl vector82
vector82:
  pushl $0
  101fdc:	6a 00                	push   $0x0
  pushl $82
  101fde:	6a 52                	push   $0x52
  jmp __alltraps
  101fe0:	e9 03 fd ff ff       	jmp    101ce8 <__alltraps>

00101fe5 <vector83>:
.globl vector83
vector83:
  pushl $0
  101fe5:	6a 00                	push   $0x0
  pushl $83
  101fe7:	6a 53                	push   $0x53
  jmp __alltraps
  101fe9:	e9 fa fc ff ff       	jmp    101ce8 <__alltraps>

00101fee <vector84>:
.globl vector84
vector84:
  pushl $0
  101fee:	6a 00                	push   $0x0
  pushl $84
  101ff0:	6a 54                	push   $0x54
  jmp __alltraps
  101ff2:	e9 f1 fc ff ff       	jmp    101ce8 <__alltraps>

00101ff7 <vector85>:
.globl vector85
vector85:
  pushl $0
  101ff7:	6a 00                	push   $0x0
  pushl $85
  101ff9:	6a 55                	push   $0x55
  jmp __alltraps
  101ffb:	e9 e8 fc ff ff       	jmp    101ce8 <__alltraps>

00102000 <vector86>:
.globl vector86
vector86:
  pushl $0
  102000:	6a 00                	push   $0x0
  pushl $86
  102002:	6a 56                	push   $0x56
  jmp __alltraps
  102004:	e9 df fc ff ff       	jmp    101ce8 <__alltraps>

00102009 <vector87>:
.globl vector87
vector87:
  pushl $0
  102009:	6a 00                	push   $0x0
  pushl $87
  10200b:	6a 57                	push   $0x57
  jmp __alltraps
  10200d:	e9 d6 fc ff ff       	jmp    101ce8 <__alltraps>

00102012 <vector88>:
.globl vector88
vector88:
  pushl $0
  102012:	6a 00                	push   $0x0
  pushl $88
  102014:	6a 58                	push   $0x58
  jmp __alltraps
  102016:	e9 cd fc ff ff       	jmp    101ce8 <__alltraps>

0010201b <vector89>:
.globl vector89
vector89:
  pushl $0
  10201b:	6a 00                	push   $0x0
  pushl $89
  10201d:	6a 59                	push   $0x59
  jmp __alltraps
  10201f:	e9 c4 fc ff ff       	jmp    101ce8 <__alltraps>

00102024 <vector90>:
.globl vector90
vector90:
  pushl $0
  102024:	6a 00                	push   $0x0
  pushl $90
  102026:	6a 5a                	push   $0x5a
  jmp __alltraps
  102028:	e9 bb fc ff ff       	jmp    101ce8 <__alltraps>

0010202d <vector91>:
.globl vector91
vector91:
  pushl $0
  10202d:	6a 00                	push   $0x0
  pushl $91
  10202f:	6a 5b                	push   $0x5b
  jmp __alltraps
  102031:	e9 b2 fc ff ff       	jmp    101ce8 <__alltraps>

00102036 <vector92>:
.globl vector92
vector92:
  pushl $0
  102036:	6a 00                	push   $0x0
  pushl $92
  102038:	6a 5c                	push   $0x5c
  jmp __alltraps
  10203a:	e9 a9 fc ff ff       	jmp    101ce8 <__alltraps>

0010203f <vector93>:
.globl vector93
vector93:
  pushl $0
  10203f:	6a 00                	push   $0x0
  pushl $93
  102041:	6a 5d                	push   $0x5d
  jmp __alltraps
  102043:	e9 a0 fc ff ff       	jmp    101ce8 <__alltraps>

00102048 <vector94>:
.globl vector94
vector94:
  pushl $0
  102048:	6a 00                	push   $0x0
  pushl $94
  10204a:	6a 5e                	push   $0x5e
  jmp __alltraps
  10204c:	e9 97 fc ff ff       	jmp    101ce8 <__alltraps>

00102051 <vector95>:
.globl vector95
vector95:
  pushl $0
  102051:	6a 00                	push   $0x0
  pushl $95
  102053:	6a 5f                	push   $0x5f
  jmp __alltraps
  102055:	e9 8e fc ff ff       	jmp    101ce8 <__alltraps>

0010205a <vector96>:
.globl vector96
vector96:
  pushl $0
  10205a:	6a 00                	push   $0x0
  pushl $96
  10205c:	6a 60                	push   $0x60
  jmp __alltraps
  10205e:	e9 85 fc ff ff       	jmp    101ce8 <__alltraps>

00102063 <vector97>:
.globl vector97
vector97:
  pushl $0
  102063:	6a 00                	push   $0x0
  pushl $97
  102065:	6a 61                	push   $0x61
  jmp __alltraps
  102067:	e9 7c fc ff ff       	jmp    101ce8 <__alltraps>

0010206c <vector98>:
.globl vector98
vector98:
  pushl $0
  10206c:	6a 00                	push   $0x0
  pushl $98
  10206e:	6a 62                	push   $0x62
  jmp __alltraps
  102070:	e9 73 fc ff ff       	jmp    101ce8 <__alltraps>

00102075 <vector99>:
.globl vector99
vector99:
  pushl $0
  102075:	6a 00                	push   $0x0
  pushl $99
  102077:	6a 63                	push   $0x63
  jmp __alltraps
  102079:	e9 6a fc ff ff       	jmp    101ce8 <__alltraps>

0010207e <vector100>:
.globl vector100
vector100:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $100
  102080:	6a 64                	push   $0x64
  jmp __alltraps
  102082:	e9 61 fc ff ff       	jmp    101ce8 <__alltraps>

00102087 <vector101>:
.globl vector101
vector101:
  pushl $0
  102087:	6a 00                	push   $0x0
  pushl $101
  102089:	6a 65                	push   $0x65
  jmp __alltraps
  10208b:	e9 58 fc ff ff       	jmp    101ce8 <__alltraps>

00102090 <vector102>:
.globl vector102
vector102:
  pushl $0
  102090:	6a 00                	push   $0x0
  pushl $102
  102092:	6a 66                	push   $0x66
  jmp __alltraps
  102094:	e9 4f fc ff ff       	jmp    101ce8 <__alltraps>

00102099 <vector103>:
.globl vector103
vector103:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $103
  10209b:	6a 67                	push   $0x67
  jmp __alltraps
  10209d:	e9 46 fc ff ff       	jmp    101ce8 <__alltraps>

001020a2 <vector104>:
.globl vector104
vector104:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $104
  1020a4:	6a 68                	push   $0x68
  jmp __alltraps
  1020a6:	e9 3d fc ff ff       	jmp    101ce8 <__alltraps>

001020ab <vector105>:
.globl vector105
vector105:
  pushl $0
  1020ab:	6a 00                	push   $0x0
  pushl $105
  1020ad:	6a 69                	push   $0x69
  jmp __alltraps
  1020af:	e9 34 fc ff ff       	jmp    101ce8 <__alltraps>

001020b4 <vector106>:
.globl vector106
vector106:
  pushl $0
  1020b4:	6a 00                	push   $0x0
  pushl $106
  1020b6:	6a 6a                	push   $0x6a
  jmp __alltraps
  1020b8:	e9 2b fc ff ff       	jmp    101ce8 <__alltraps>

001020bd <vector107>:
.globl vector107
vector107:
  pushl $0
  1020bd:	6a 00                	push   $0x0
  pushl $107
  1020bf:	6a 6b                	push   $0x6b
  jmp __alltraps
  1020c1:	e9 22 fc ff ff       	jmp    101ce8 <__alltraps>

001020c6 <vector108>:
.globl vector108
vector108:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $108
  1020c8:	6a 6c                	push   $0x6c
  jmp __alltraps
  1020ca:	e9 19 fc ff ff       	jmp    101ce8 <__alltraps>

001020cf <vector109>:
.globl vector109
vector109:
  pushl $0
  1020cf:	6a 00                	push   $0x0
  pushl $109
  1020d1:	6a 6d                	push   $0x6d
  jmp __alltraps
  1020d3:	e9 10 fc ff ff       	jmp    101ce8 <__alltraps>

001020d8 <vector110>:
.globl vector110
vector110:
  pushl $0
  1020d8:	6a 00                	push   $0x0
  pushl $110
  1020da:	6a 6e                	push   $0x6e
  jmp __alltraps
  1020dc:	e9 07 fc ff ff       	jmp    101ce8 <__alltraps>

001020e1 <vector111>:
.globl vector111
vector111:
  pushl $0
  1020e1:	6a 00                	push   $0x0
  pushl $111
  1020e3:	6a 6f                	push   $0x6f
  jmp __alltraps
  1020e5:	e9 fe fb ff ff       	jmp    101ce8 <__alltraps>

001020ea <vector112>:
.globl vector112
vector112:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $112
  1020ec:	6a 70                	push   $0x70
  jmp __alltraps
  1020ee:	e9 f5 fb ff ff       	jmp    101ce8 <__alltraps>

001020f3 <vector113>:
.globl vector113
vector113:
  pushl $0
  1020f3:	6a 00                	push   $0x0
  pushl $113
  1020f5:	6a 71                	push   $0x71
  jmp __alltraps
  1020f7:	e9 ec fb ff ff       	jmp    101ce8 <__alltraps>

001020fc <vector114>:
.globl vector114
vector114:
  pushl $0
  1020fc:	6a 00                	push   $0x0
  pushl $114
  1020fe:	6a 72                	push   $0x72
  jmp __alltraps
  102100:	e9 e3 fb ff ff       	jmp    101ce8 <__alltraps>

00102105 <vector115>:
.globl vector115
vector115:
  pushl $0
  102105:	6a 00                	push   $0x0
  pushl $115
  102107:	6a 73                	push   $0x73
  jmp __alltraps
  102109:	e9 da fb ff ff       	jmp    101ce8 <__alltraps>

0010210e <vector116>:
.globl vector116
vector116:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $116
  102110:	6a 74                	push   $0x74
  jmp __alltraps
  102112:	e9 d1 fb ff ff       	jmp    101ce8 <__alltraps>

00102117 <vector117>:
.globl vector117
vector117:
  pushl $0
  102117:	6a 00                	push   $0x0
  pushl $117
  102119:	6a 75                	push   $0x75
  jmp __alltraps
  10211b:	e9 c8 fb ff ff       	jmp    101ce8 <__alltraps>

00102120 <vector118>:
.globl vector118
vector118:
  pushl $0
  102120:	6a 00                	push   $0x0
  pushl $118
  102122:	6a 76                	push   $0x76
  jmp __alltraps
  102124:	e9 bf fb ff ff       	jmp    101ce8 <__alltraps>

00102129 <vector119>:
.globl vector119
vector119:
  pushl $0
  102129:	6a 00                	push   $0x0
  pushl $119
  10212b:	6a 77                	push   $0x77
  jmp __alltraps
  10212d:	e9 b6 fb ff ff       	jmp    101ce8 <__alltraps>

00102132 <vector120>:
.globl vector120
vector120:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $120
  102134:	6a 78                	push   $0x78
  jmp __alltraps
  102136:	e9 ad fb ff ff       	jmp    101ce8 <__alltraps>

0010213b <vector121>:
.globl vector121
vector121:
  pushl $0
  10213b:	6a 00                	push   $0x0
  pushl $121
  10213d:	6a 79                	push   $0x79
  jmp __alltraps
  10213f:	e9 a4 fb ff ff       	jmp    101ce8 <__alltraps>

00102144 <vector122>:
.globl vector122
vector122:
  pushl $0
  102144:	6a 00                	push   $0x0
  pushl $122
  102146:	6a 7a                	push   $0x7a
  jmp __alltraps
  102148:	e9 9b fb ff ff       	jmp    101ce8 <__alltraps>

0010214d <vector123>:
.globl vector123
vector123:
  pushl $0
  10214d:	6a 00                	push   $0x0
  pushl $123
  10214f:	6a 7b                	push   $0x7b
  jmp __alltraps
  102151:	e9 92 fb ff ff       	jmp    101ce8 <__alltraps>

00102156 <vector124>:
.globl vector124
vector124:
  pushl $0
  102156:	6a 00                	push   $0x0
  pushl $124
  102158:	6a 7c                	push   $0x7c
  jmp __alltraps
  10215a:	e9 89 fb ff ff       	jmp    101ce8 <__alltraps>

0010215f <vector125>:
.globl vector125
vector125:
  pushl $0
  10215f:	6a 00                	push   $0x0
  pushl $125
  102161:	6a 7d                	push   $0x7d
  jmp __alltraps
  102163:	e9 80 fb ff ff       	jmp    101ce8 <__alltraps>

00102168 <vector126>:
.globl vector126
vector126:
  pushl $0
  102168:	6a 00                	push   $0x0
  pushl $126
  10216a:	6a 7e                	push   $0x7e
  jmp __alltraps
  10216c:	e9 77 fb ff ff       	jmp    101ce8 <__alltraps>

00102171 <vector127>:
.globl vector127
vector127:
  pushl $0
  102171:	6a 00                	push   $0x0
  pushl $127
  102173:	6a 7f                	push   $0x7f
  jmp __alltraps
  102175:	e9 6e fb ff ff       	jmp    101ce8 <__alltraps>

0010217a <vector128>:
.globl vector128
vector128:
  pushl $0
  10217a:	6a 00                	push   $0x0
  pushl $128
  10217c:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102181:	e9 62 fb ff ff       	jmp    101ce8 <__alltraps>

00102186 <vector129>:
.globl vector129
vector129:
  pushl $0
  102186:	6a 00                	push   $0x0
  pushl $129
  102188:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10218d:	e9 56 fb ff ff       	jmp    101ce8 <__alltraps>

00102192 <vector130>:
.globl vector130
vector130:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $130
  102194:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102199:	e9 4a fb ff ff       	jmp    101ce8 <__alltraps>

0010219e <vector131>:
.globl vector131
vector131:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $131
  1021a0:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1021a5:	e9 3e fb ff ff       	jmp    101ce8 <__alltraps>

001021aa <vector132>:
.globl vector132
vector132:
  pushl $0
  1021aa:	6a 00                	push   $0x0
  pushl $132
  1021ac:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1021b1:	e9 32 fb ff ff       	jmp    101ce8 <__alltraps>

001021b6 <vector133>:
.globl vector133
vector133:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $133
  1021b8:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1021bd:	e9 26 fb ff ff       	jmp    101ce8 <__alltraps>

001021c2 <vector134>:
.globl vector134
vector134:
  pushl $0
  1021c2:	6a 00                	push   $0x0
  pushl $134
  1021c4:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1021c9:	e9 1a fb ff ff       	jmp    101ce8 <__alltraps>

001021ce <vector135>:
.globl vector135
vector135:
  pushl $0
  1021ce:	6a 00                	push   $0x0
  pushl $135
  1021d0:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1021d5:	e9 0e fb ff ff       	jmp    101ce8 <__alltraps>

001021da <vector136>:
.globl vector136
vector136:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $136
  1021dc:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1021e1:	e9 02 fb ff ff       	jmp    101ce8 <__alltraps>

001021e6 <vector137>:
.globl vector137
vector137:
  pushl $0
  1021e6:	6a 00                	push   $0x0
  pushl $137
  1021e8:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1021ed:	e9 f6 fa ff ff       	jmp    101ce8 <__alltraps>

001021f2 <vector138>:
.globl vector138
vector138:
  pushl $0
  1021f2:	6a 00                	push   $0x0
  pushl $138
  1021f4:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1021f9:	e9 ea fa ff ff       	jmp    101ce8 <__alltraps>

001021fe <vector139>:
.globl vector139
vector139:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $139
  102200:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102205:	e9 de fa ff ff       	jmp    101ce8 <__alltraps>

0010220a <vector140>:
.globl vector140
vector140:
  pushl $0
  10220a:	6a 00                	push   $0x0
  pushl $140
  10220c:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102211:	e9 d2 fa ff ff       	jmp    101ce8 <__alltraps>

00102216 <vector141>:
.globl vector141
vector141:
  pushl $0
  102216:	6a 00                	push   $0x0
  pushl $141
  102218:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10221d:	e9 c6 fa ff ff       	jmp    101ce8 <__alltraps>

00102222 <vector142>:
.globl vector142
vector142:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $142
  102224:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102229:	e9 ba fa ff ff       	jmp    101ce8 <__alltraps>

0010222e <vector143>:
.globl vector143
vector143:
  pushl $0
  10222e:	6a 00                	push   $0x0
  pushl $143
  102230:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102235:	e9 ae fa ff ff       	jmp    101ce8 <__alltraps>

0010223a <vector144>:
.globl vector144
vector144:
  pushl $0
  10223a:	6a 00                	push   $0x0
  pushl $144
  10223c:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102241:	e9 a2 fa ff ff       	jmp    101ce8 <__alltraps>

00102246 <vector145>:
.globl vector145
vector145:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $145
  102248:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10224d:	e9 96 fa ff ff       	jmp    101ce8 <__alltraps>

00102252 <vector146>:
.globl vector146
vector146:
  pushl $0
  102252:	6a 00                	push   $0x0
  pushl $146
  102254:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102259:	e9 8a fa ff ff       	jmp    101ce8 <__alltraps>

0010225e <vector147>:
.globl vector147
vector147:
  pushl $0
  10225e:	6a 00                	push   $0x0
  pushl $147
  102260:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102265:	e9 7e fa ff ff       	jmp    101ce8 <__alltraps>

0010226a <vector148>:
.globl vector148
vector148:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $148
  10226c:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102271:	e9 72 fa ff ff       	jmp    101ce8 <__alltraps>

00102276 <vector149>:
.globl vector149
vector149:
  pushl $0
  102276:	6a 00                	push   $0x0
  pushl $149
  102278:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10227d:	e9 66 fa ff ff       	jmp    101ce8 <__alltraps>

00102282 <vector150>:
.globl vector150
vector150:
  pushl $0
  102282:	6a 00                	push   $0x0
  pushl $150
  102284:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102289:	e9 5a fa ff ff       	jmp    101ce8 <__alltraps>

0010228e <vector151>:
.globl vector151
vector151:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $151
  102290:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102295:	e9 4e fa ff ff       	jmp    101ce8 <__alltraps>

0010229a <vector152>:
.globl vector152
vector152:
  pushl $0
  10229a:	6a 00                	push   $0x0
  pushl $152
  10229c:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1022a1:	e9 42 fa ff ff       	jmp    101ce8 <__alltraps>

001022a6 <vector153>:
.globl vector153
vector153:
  pushl $0
  1022a6:	6a 00                	push   $0x0
  pushl $153
  1022a8:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1022ad:	e9 36 fa ff ff       	jmp    101ce8 <__alltraps>

001022b2 <vector154>:
.globl vector154
vector154:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $154
  1022b4:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1022b9:	e9 2a fa ff ff       	jmp    101ce8 <__alltraps>

001022be <vector155>:
.globl vector155
vector155:
  pushl $0
  1022be:	6a 00                	push   $0x0
  pushl $155
  1022c0:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1022c5:	e9 1e fa ff ff       	jmp    101ce8 <__alltraps>

001022ca <vector156>:
.globl vector156
vector156:
  pushl $0
  1022ca:	6a 00                	push   $0x0
  pushl $156
  1022cc:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1022d1:	e9 12 fa ff ff       	jmp    101ce8 <__alltraps>

001022d6 <vector157>:
.globl vector157
vector157:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $157
  1022d8:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1022dd:	e9 06 fa ff ff       	jmp    101ce8 <__alltraps>

001022e2 <vector158>:
.globl vector158
vector158:
  pushl $0
  1022e2:	6a 00                	push   $0x0
  pushl $158
  1022e4:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1022e9:	e9 fa f9 ff ff       	jmp    101ce8 <__alltraps>

001022ee <vector159>:
.globl vector159
vector159:
  pushl $0
  1022ee:	6a 00                	push   $0x0
  pushl $159
  1022f0:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1022f5:	e9 ee f9 ff ff       	jmp    101ce8 <__alltraps>

001022fa <vector160>:
.globl vector160
vector160:
  pushl $0
  1022fa:	6a 00                	push   $0x0
  pushl $160
  1022fc:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102301:	e9 e2 f9 ff ff       	jmp    101ce8 <__alltraps>

00102306 <vector161>:
.globl vector161
vector161:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $161
  102308:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10230d:	e9 d6 f9 ff ff       	jmp    101ce8 <__alltraps>

00102312 <vector162>:
.globl vector162
vector162:
  pushl $0
  102312:	6a 00                	push   $0x0
  pushl $162
  102314:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102319:	e9 ca f9 ff ff       	jmp    101ce8 <__alltraps>

0010231e <vector163>:
.globl vector163
vector163:
  pushl $0
  10231e:	6a 00                	push   $0x0
  pushl $163
  102320:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102325:	e9 be f9 ff ff       	jmp    101ce8 <__alltraps>

0010232a <vector164>:
.globl vector164
vector164:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $164
  10232c:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102331:	e9 b2 f9 ff ff       	jmp    101ce8 <__alltraps>

00102336 <vector165>:
.globl vector165
vector165:
  pushl $0
  102336:	6a 00                	push   $0x0
  pushl $165
  102338:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10233d:	e9 a6 f9 ff ff       	jmp    101ce8 <__alltraps>

00102342 <vector166>:
.globl vector166
vector166:
  pushl $0
  102342:	6a 00                	push   $0x0
  pushl $166
  102344:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102349:	e9 9a f9 ff ff       	jmp    101ce8 <__alltraps>

0010234e <vector167>:
.globl vector167
vector167:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $167
  102350:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102355:	e9 8e f9 ff ff       	jmp    101ce8 <__alltraps>

0010235a <vector168>:
.globl vector168
vector168:
  pushl $0
  10235a:	6a 00                	push   $0x0
  pushl $168
  10235c:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102361:	e9 82 f9 ff ff       	jmp    101ce8 <__alltraps>

00102366 <vector169>:
.globl vector169
vector169:
  pushl $0
  102366:	6a 00                	push   $0x0
  pushl $169
  102368:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10236d:	e9 76 f9 ff ff       	jmp    101ce8 <__alltraps>

00102372 <vector170>:
.globl vector170
vector170:
  pushl $0
  102372:	6a 00                	push   $0x0
  pushl $170
  102374:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102379:	e9 6a f9 ff ff       	jmp    101ce8 <__alltraps>

0010237e <vector171>:
.globl vector171
vector171:
  pushl $0
  10237e:	6a 00                	push   $0x0
  pushl $171
  102380:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102385:	e9 5e f9 ff ff       	jmp    101ce8 <__alltraps>

0010238a <vector172>:
.globl vector172
vector172:
  pushl $0
  10238a:	6a 00                	push   $0x0
  pushl $172
  10238c:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102391:	e9 52 f9 ff ff       	jmp    101ce8 <__alltraps>

00102396 <vector173>:
.globl vector173
vector173:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $173
  102398:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10239d:	e9 46 f9 ff ff       	jmp    101ce8 <__alltraps>

001023a2 <vector174>:
.globl vector174
vector174:
  pushl $0
  1023a2:	6a 00                	push   $0x0
  pushl $174
  1023a4:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1023a9:	e9 3a f9 ff ff       	jmp    101ce8 <__alltraps>

001023ae <vector175>:
.globl vector175
vector175:
  pushl $0
  1023ae:	6a 00                	push   $0x0
  pushl $175
  1023b0:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1023b5:	e9 2e f9 ff ff       	jmp    101ce8 <__alltraps>

001023ba <vector176>:
.globl vector176
vector176:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $176
  1023bc:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1023c1:	e9 22 f9 ff ff       	jmp    101ce8 <__alltraps>

001023c6 <vector177>:
.globl vector177
vector177:
  pushl $0
  1023c6:	6a 00                	push   $0x0
  pushl $177
  1023c8:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1023cd:	e9 16 f9 ff ff       	jmp    101ce8 <__alltraps>

001023d2 <vector178>:
.globl vector178
vector178:
  pushl $0
  1023d2:	6a 00                	push   $0x0
  pushl $178
  1023d4:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1023d9:	e9 0a f9 ff ff       	jmp    101ce8 <__alltraps>

001023de <vector179>:
.globl vector179
vector179:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $179
  1023e0:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1023e5:	e9 fe f8 ff ff       	jmp    101ce8 <__alltraps>

001023ea <vector180>:
.globl vector180
vector180:
  pushl $0
  1023ea:	6a 00                	push   $0x0
  pushl $180
  1023ec:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1023f1:	e9 f2 f8 ff ff       	jmp    101ce8 <__alltraps>

001023f6 <vector181>:
.globl vector181
vector181:
  pushl $0
  1023f6:	6a 00                	push   $0x0
  pushl $181
  1023f8:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1023fd:	e9 e6 f8 ff ff       	jmp    101ce8 <__alltraps>

00102402 <vector182>:
.globl vector182
vector182:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $182
  102404:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102409:	e9 da f8 ff ff       	jmp    101ce8 <__alltraps>

0010240e <vector183>:
.globl vector183
vector183:
  pushl $0
  10240e:	6a 00                	push   $0x0
  pushl $183
  102410:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102415:	e9 ce f8 ff ff       	jmp    101ce8 <__alltraps>

0010241a <vector184>:
.globl vector184
vector184:
  pushl $0
  10241a:	6a 00                	push   $0x0
  pushl $184
  10241c:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102421:	e9 c2 f8 ff ff       	jmp    101ce8 <__alltraps>

00102426 <vector185>:
.globl vector185
vector185:
  pushl $0
  102426:	6a 00                	push   $0x0
  pushl $185
  102428:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10242d:	e9 b6 f8 ff ff       	jmp    101ce8 <__alltraps>

00102432 <vector186>:
.globl vector186
vector186:
  pushl $0
  102432:	6a 00                	push   $0x0
  pushl $186
  102434:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102439:	e9 aa f8 ff ff       	jmp    101ce8 <__alltraps>

0010243e <vector187>:
.globl vector187
vector187:
  pushl $0
  10243e:	6a 00                	push   $0x0
  pushl $187
  102440:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102445:	e9 9e f8 ff ff       	jmp    101ce8 <__alltraps>

0010244a <vector188>:
.globl vector188
vector188:
  pushl $0
  10244a:	6a 00                	push   $0x0
  pushl $188
  10244c:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102451:	e9 92 f8 ff ff       	jmp    101ce8 <__alltraps>

00102456 <vector189>:
.globl vector189
vector189:
  pushl $0
  102456:	6a 00                	push   $0x0
  pushl $189
  102458:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10245d:	e9 86 f8 ff ff       	jmp    101ce8 <__alltraps>

00102462 <vector190>:
.globl vector190
vector190:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $190
  102464:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102469:	e9 7a f8 ff ff       	jmp    101ce8 <__alltraps>

0010246e <vector191>:
.globl vector191
vector191:
  pushl $0
  10246e:	6a 00                	push   $0x0
  pushl $191
  102470:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102475:	e9 6e f8 ff ff       	jmp    101ce8 <__alltraps>

0010247a <vector192>:
.globl vector192
vector192:
  pushl $0
  10247a:	6a 00                	push   $0x0
  pushl $192
  10247c:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102481:	e9 62 f8 ff ff       	jmp    101ce8 <__alltraps>

00102486 <vector193>:
.globl vector193
vector193:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $193
  102488:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10248d:	e9 56 f8 ff ff       	jmp    101ce8 <__alltraps>

00102492 <vector194>:
.globl vector194
vector194:
  pushl $0
  102492:	6a 00                	push   $0x0
  pushl $194
  102494:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102499:	e9 4a f8 ff ff       	jmp    101ce8 <__alltraps>

0010249e <vector195>:
.globl vector195
vector195:
  pushl $0
  10249e:	6a 00                	push   $0x0
  pushl $195
  1024a0:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1024a5:	e9 3e f8 ff ff       	jmp    101ce8 <__alltraps>

001024aa <vector196>:
.globl vector196
vector196:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $196
  1024ac:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1024b1:	e9 32 f8 ff ff       	jmp    101ce8 <__alltraps>

001024b6 <vector197>:
.globl vector197
vector197:
  pushl $0
  1024b6:	6a 00                	push   $0x0
  pushl $197
  1024b8:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1024bd:	e9 26 f8 ff ff       	jmp    101ce8 <__alltraps>

001024c2 <vector198>:
.globl vector198
vector198:
  pushl $0
  1024c2:	6a 00                	push   $0x0
  pushl $198
  1024c4:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1024c9:	e9 1a f8 ff ff       	jmp    101ce8 <__alltraps>

001024ce <vector199>:
.globl vector199
vector199:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $199
  1024d0:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1024d5:	e9 0e f8 ff ff       	jmp    101ce8 <__alltraps>

001024da <vector200>:
.globl vector200
vector200:
  pushl $0
  1024da:	6a 00                	push   $0x0
  pushl $200
  1024dc:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1024e1:	e9 02 f8 ff ff       	jmp    101ce8 <__alltraps>

001024e6 <vector201>:
.globl vector201
vector201:
  pushl $0
  1024e6:	6a 00                	push   $0x0
  pushl $201
  1024e8:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1024ed:	e9 f6 f7 ff ff       	jmp    101ce8 <__alltraps>

001024f2 <vector202>:
.globl vector202
vector202:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $202
  1024f4:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1024f9:	e9 ea f7 ff ff       	jmp    101ce8 <__alltraps>

001024fe <vector203>:
.globl vector203
vector203:
  pushl $0
  1024fe:	6a 00                	push   $0x0
  pushl $203
  102500:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102505:	e9 de f7 ff ff       	jmp    101ce8 <__alltraps>

0010250a <vector204>:
.globl vector204
vector204:
  pushl $0
  10250a:	6a 00                	push   $0x0
  pushl $204
  10250c:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102511:	e9 d2 f7 ff ff       	jmp    101ce8 <__alltraps>

00102516 <vector205>:
.globl vector205
vector205:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $205
  102518:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10251d:	e9 c6 f7 ff ff       	jmp    101ce8 <__alltraps>

00102522 <vector206>:
.globl vector206
vector206:
  pushl $0
  102522:	6a 00                	push   $0x0
  pushl $206
  102524:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102529:	e9 ba f7 ff ff       	jmp    101ce8 <__alltraps>

0010252e <vector207>:
.globl vector207
vector207:
  pushl $0
  10252e:	6a 00                	push   $0x0
  pushl $207
  102530:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102535:	e9 ae f7 ff ff       	jmp    101ce8 <__alltraps>

0010253a <vector208>:
.globl vector208
vector208:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $208
  10253c:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102541:	e9 a2 f7 ff ff       	jmp    101ce8 <__alltraps>

00102546 <vector209>:
.globl vector209
vector209:
  pushl $0
  102546:	6a 00                	push   $0x0
  pushl $209
  102548:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10254d:	e9 96 f7 ff ff       	jmp    101ce8 <__alltraps>

00102552 <vector210>:
.globl vector210
vector210:
  pushl $0
  102552:	6a 00                	push   $0x0
  pushl $210
  102554:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102559:	e9 8a f7 ff ff       	jmp    101ce8 <__alltraps>

0010255e <vector211>:
.globl vector211
vector211:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $211
  102560:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102565:	e9 7e f7 ff ff       	jmp    101ce8 <__alltraps>

0010256a <vector212>:
.globl vector212
vector212:
  pushl $0
  10256a:	6a 00                	push   $0x0
  pushl $212
  10256c:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102571:	e9 72 f7 ff ff       	jmp    101ce8 <__alltraps>

00102576 <vector213>:
.globl vector213
vector213:
  pushl $0
  102576:	6a 00                	push   $0x0
  pushl $213
  102578:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10257d:	e9 66 f7 ff ff       	jmp    101ce8 <__alltraps>

00102582 <vector214>:
.globl vector214
vector214:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $214
  102584:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102589:	e9 5a f7 ff ff       	jmp    101ce8 <__alltraps>

0010258e <vector215>:
.globl vector215
vector215:
  pushl $0
  10258e:	6a 00                	push   $0x0
  pushl $215
  102590:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102595:	e9 4e f7 ff ff       	jmp    101ce8 <__alltraps>

0010259a <vector216>:
.globl vector216
vector216:
  pushl $0
  10259a:	6a 00                	push   $0x0
  pushl $216
  10259c:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1025a1:	e9 42 f7 ff ff       	jmp    101ce8 <__alltraps>

001025a6 <vector217>:
.globl vector217
vector217:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $217
  1025a8:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1025ad:	e9 36 f7 ff ff       	jmp    101ce8 <__alltraps>

001025b2 <vector218>:
.globl vector218
vector218:
  pushl $0
  1025b2:	6a 00                	push   $0x0
  pushl $218
  1025b4:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1025b9:	e9 2a f7 ff ff       	jmp    101ce8 <__alltraps>

001025be <vector219>:
.globl vector219
vector219:
  pushl $0
  1025be:	6a 00                	push   $0x0
  pushl $219
  1025c0:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1025c5:	e9 1e f7 ff ff       	jmp    101ce8 <__alltraps>

001025ca <vector220>:
.globl vector220
vector220:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $220
  1025cc:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1025d1:	e9 12 f7 ff ff       	jmp    101ce8 <__alltraps>

001025d6 <vector221>:
.globl vector221
vector221:
  pushl $0
  1025d6:	6a 00                	push   $0x0
  pushl $221
  1025d8:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1025dd:	e9 06 f7 ff ff       	jmp    101ce8 <__alltraps>

001025e2 <vector222>:
.globl vector222
vector222:
  pushl $0
  1025e2:	6a 00                	push   $0x0
  pushl $222
  1025e4:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1025e9:	e9 fa f6 ff ff       	jmp    101ce8 <__alltraps>

001025ee <vector223>:
.globl vector223
vector223:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $223
  1025f0:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1025f5:	e9 ee f6 ff ff       	jmp    101ce8 <__alltraps>

001025fa <vector224>:
.globl vector224
vector224:
  pushl $0
  1025fa:	6a 00                	push   $0x0
  pushl $224
  1025fc:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102601:	e9 e2 f6 ff ff       	jmp    101ce8 <__alltraps>

00102606 <vector225>:
.globl vector225
vector225:
  pushl $0
  102606:	6a 00                	push   $0x0
  pushl $225
  102608:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10260d:	e9 d6 f6 ff ff       	jmp    101ce8 <__alltraps>

00102612 <vector226>:
.globl vector226
vector226:
  pushl $0
  102612:	6a 00                	push   $0x0
  pushl $226
  102614:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102619:	e9 ca f6 ff ff       	jmp    101ce8 <__alltraps>

0010261e <vector227>:
.globl vector227
vector227:
  pushl $0
  10261e:	6a 00                	push   $0x0
  pushl $227
  102620:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102625:	e9 be f6 ff ff       	jmp    101ce8 <__alltraps>

0010262a <vector228>:
.globl vector228
vector228:
  pushl $0
  10262a:	6a 00                	push   $0x0
  pushl $228
  10262c:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102631:	e9 b2 f6 ff ff       	jmp    101ce8 <__alltraps>

00102636 <vector229>:
.globl vector229
vector229:
  pushl $0
  102636:	6a 00                	push   $0x0
  pushl $229
  102638:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10263d:	e9 a6 f6 ff ff       	jmp    101ce8 <__alltraps>

00102642 <vector230>:
.globl vector230
vector230:
  pushl $0
  102642:	6a 00                	push   $0x0
  pushl $230
  102644:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102649:	e9 9a f6 ff ff       	jmp    101ce8 <__alltraps>

0010264e <vector231>:
.globl vector231
vector231:
  pushl $0
  10264e:	6a 00                	push   $0x0
  pushl $231
  102650:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102655:	e9 8e f6 ff ff       	jmp    101ce8 <__alltraps>

0010265a <vector232>:
.globl vector232
vector232:
  pushl $0
  10265a:	6a 00                	push   $0x0
  pushl $232
  10265c:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102661:	e9 82 f6 ff ff       	jmp    101ce8 <__alltraps>

00102666 <vector233>:
.globl vector233
vector233:
  pushl $0
  102666:	6a 00                	push   $0x0
  pushl $233
  102668:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10266d:	e9 76 f6 ff ff       	jmp    101ce8 <__alltraps>

00102672 <vector234>:
.globl vector234
vector234:
  pushl $0
  102672:	6a 00                	push   $0x0
  pushl $234
  102674:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102679:	e9 6a f6 ff ff       	jmp    101ce8 <__alltraps>

0010267e <vector235>:
.globl vector235
vector235:
  pushl $0
  10267e:	6a 00                	push   $0x0
  pushl $235
  102680:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102685:	e9 5e f6 ff ff       	jmp    101ce8 <__alltraps>

0010268a <vector236>:
.globl vector236
vector236:
  pushl $0
  10268a:	6a 00                	push   $0x0
  pushl $236
  10268c:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102691:	e9 52 f6 ff ff       	jmp    101ce8 <__alltraps>

00102696 <vector237>:
.globl vector237
vector237:
  pushl $0
  102696:	6a 00                	push   $0x0
  pushl $237
  102698:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10269d:	e9 46 f6 ff ff       	jmp    101ce8 <__alltraps>

001026a2 <vector238>:
.globl vector238
vector238:
  pushl $0
  1026a2:	6a 00                	push   $0x0
  pushl $238
  1026a4:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1026a9:	e9 3a f6 ff ff       	jmp    101ce8 <__alltraps>

001026ae <vector239>:
.globl vector239
vector239:
  pushl $0
  1026ae:	6a 00                	push   $0x0
  pushl $239
  1026b0:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1026b5:	e9 2e f6 ff ff       	jmp    101ce8 <__alltraps>

001026ba <vector240>:
.globl vector240
vector240:
  pushl $0
  1026ba:	6a 00                	push   $0x0
  pushl $240
  1026bc:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1026c1:	e9 22 f6 ff ff       	jmp    101ce8 <__alltraps>

001026c6 <vector241>:
.globl vector241
vector241:
  pushl $0
  1026c6:	6a 00                	push   $0x0
  pushl $241
  1026c8:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1026cd:	e9 16 f6 ff ff       	jmp    101ce8 <__alltraps>

001026d2 <vector242>:
.globl vector242
vector242:
  pushl $0
  1026d2:	6a 00                	push   $0x0
  pushl $242
  1026d4:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1026d9:	e9 0a f6 ff ff       	jmp    101ce8 <__alltraps>

001026de <vector243>:
.globl vector243
vector243:
  pushl $0
  1026de:	6a 00                	push   $0x0
  pushl $243
  1026e0:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1026e5:	e9 fe f5 ff ff       	jmp    101ce8 <__alltraps>

001026ea <vector244>:
.globl vector244
vector244:
  pushl $0
  1026ea:	6a 00                	push   $0x0
  pushl $244
  1026ec:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1026f1:	e9 f2 f5 ff ff       	jmp    101ce8 <__alltraps>

001026f6 <vector245>:
.globl vector245
vector245:
  pushl $0
  1026f6:	6a 00                	push   $0x0
  pushl $245
  1026f8:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1026fd:	e9 e6 f5 ff ff       	jmp    101ce8 <__alltraps>

00102702 <vector246>:
.globl vector246
vector246:
  pushl $0
  102702:	6a 00                	push   $0x0
  pushl $246
  102704:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102709:	e9 da f5 ff ff       	jmp    101ce8 <__alltraps>

0010270e <vector247>:
.globl vector247
vector247:
  pushl $0
  10270e:	6a 00                	push   $0x0
  pushl $247
  102710:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102715:	e9 ce f5 ff ff       	jmp    101ce8 <__alltraps>

0010271a <vector248>:
.globl vector248
vector248:
  pushl $0
  10271a:	6a 00                	push   $0x0
  pushl $248
  10271c:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102721:	e9 c2 f5 ff ff       	jmp    101ce8 <__alltraps>

00102726 <vector249>:
.globl vector249
vector249:
  pushl $0
  102726:	6a 00                	push   $0x0
  pushl $249
  102728:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10272d:	e9 b6 f5 ff ff       	jmp    101ce8 <__alltraps>

00102732 <vector250>:
.globl vector250
vector250:
  pushl $0
  102732:	6a 00                	push   $0x0
  pushl $250
  102734:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102739:	e9 aa f5 ff ff       	jmp    101ce8 <__alltraps>

0010273e <vector251>:
.globl vector251
vector251:
  pushl $0
  10273e:	6a 00                	push   $0x0
  pushl $251
  102740:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102745:	e9 9e f5 ff ff       	jmp    101ce8 <__alltraps>

0010274a <vector252>:
.globl vector252
vector252:
  pushl $0
  10274a:	6a 00                	push   $0x0
  pushl $252
  10274c:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102751:	e9 92 f5 ff ff       	jmp    101ce8 <__alltraps>

00102756 <vector253>:
.globl vector253
vector253:
  pushl $0
  102756:	6a 00                	push   $0x0
  pushl $253
  102758:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10275d:	e9 86 f5 ff ff       	jmp    101ce8 <__alltraps>

00102762 <vector254>:
.globl vector254
vector254:
  pushl $0
  102762:	6a 00                	push   $0x0
  pushl $254
  102764:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102769:	e9 7a f5 ff ff       	jmp    101ce8 <__alltraps>

0010276e <vector255>:
.globl vector255
vector255:
  pushl $0
  10276e:	6a 00                	push   $0x0
  pushl $255
  102770:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102775:	e9 6e f5 ff ff       	jmp    101ce8 <__alltraps>

0010277a <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10277a:	55                   	push   %ebp
  10277b:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10277d:	8b 45 08             	mov    0x8(%ebp),%eax
  102780:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102783:	b8 23 00 00 00       	mov    $0x23,%eax
  102788:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10278a:	b8 23 00 00 00       	mov    $0x23,%eax
  10278f:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102791:	b8 10 00 00 00       	mov    $0x10,%eax
  102796:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102798:	b8 10 00 00 00       	mov    $0x10,%eax
  10279d:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10279f:	b8 10 00 00 00       	mov    $0x10,%eax
  1027a4:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1027a6:	ea ad 27 10 00 08 00 	ljmp   $0x8,$0x1027ad
}
  1027ad:	5d                   	pop    %ebp
  1027ae:	c3                   	ret    

001027af <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1027af:	55                   	push   %ebp
  1027b0:	89 e5                	mov    %esp,%ebp
  1027b2:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1027b5:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  1027ba:	05 00 04 00 00       	add    $0x400,%eax
  1027bf:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1027c4:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1027cb:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1027cd:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1027d4:	68 00 
  1027d6:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1027db:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1027e1:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1027e6:	c1 e8 10             	shr    $0x10,%eax
  1027e9:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1027ee:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1027f5:	83 e0 f0             	and    $0xfffffff0,%eax
  1027f8:	83 c8 09             	or     $0x9,%eax
  1027fb:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102800:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102807:	83 c8 10             	or     $0x10,%eax
  10280a:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10280f:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102816:	83 e0 9f             	and    $0xffffff9f,%eax
  102819:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10281e:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102825:	83 c8 80             	or     $0xffffff80,%eax
  102828:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10282d:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102834:	83 e0 f0             	and    $0xfffffff0,%eax
  102837:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10283c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102843:	83 e0 ef             	and    $0xffffffef,%eax
  102846:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10284b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102852:	83 e0 df             	and    $0xffffffdf,%eax
  102855:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10285a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102861:	83 c8 40             	or     $0x40,%eax
  102864:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102869:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102870:	83 e0 7f             	and    $0x7f,%eax
  102873:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102878:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10287d:	c1 e8 18             	shr    $0x18,%eax
  102880:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102885:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10288c:	83 e0 ef             	and    $0xffffffef,%eax
  10288f:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102894:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  10289b:	e8 da fe ff ff       	call   10277a <lgdt>
  1028a0:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1028a6:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1028aa:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  1028ad:	c9                   	leave  
  1028ae:	c3                   	ret    

001028af <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1028af:	55                   	push   %ebp
  1028b0:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1028b2:	e8 f8 fe ff ff       	call   1027af <gdt_init>
}
  1028b7:	5d                   	pop    %ebp
  1028b8:	c3                   	ret    

001028b9 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1028b9:	55                   	push   %ebp
  1028ba:	89 e5                	mov    %esp,%ebp
  1028bc:	83 ec 58             	sub    $0x58,%esp
  1028bf:	8b 45 10             	mov    0x10(%ebp),%eax
  1028c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1028c5:	8b 45 14             	mov    0x14(%ebp),%eax
  1028c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1028cb:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1028ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1028d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1028d4:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1028d7:	8b 45 18             	mov    0x18(%ebp),%eax
  1028da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1028dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1028e0:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1028e3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1028e6:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1028e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1028ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1028f3:	74 1c                	je     102911 <printnum+0x58>
  1028f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028f8:	ba 00 00 00 00       	mov    $0x0,%edx
  1028fd:	f7 75 e4             	divl   -0x1c(%ebp)
  102900:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102903:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102906:	ba 00 00 00 00       	mov    $0x0,%edx
  10290b:	f7 75 e4             	divl   -0x1c(%ebp)
  10290e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102911:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102914:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102917:	f7 75 e4             	divl   -0x1c(%ebp)
  10291a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10291d:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102920:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102923:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102926:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102929:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10292c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10292f:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102932:	8b 45 18             	mov    0x18(%ebp),%eax
  102935:	ba 00 00 00 00       	mov    $0x0,%edx
  10293a:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10293d:	77 56                	ja     102995 <printnum+0xdc>
  10293f:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102942:	72 05                	jb     102949 <printnum+0x90>
  102944:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102947:	77 4c                	ja     102995 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102949:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10294c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10294f:	8b 45 20             	mov    0x20(%ebp),%eax
  102952:	89 44 24 18          	mov    %eax,0x18(%esp)
  102956:	89 54 24 14          	mov    %edx,0x14(%esp)
  10295a:	8b 45 18             	mov    0x18(%ebp),%eax
  10295d:	89 44 24 10          	mov    %eax,0x10(%esp)
  102961:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102964:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102967:	89 44 24 08          	mov    %eax,0x8(%esp)
  10296b:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10296f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102972:	89 44 24 04          	mov    %eax,0x4(%esp)
  102976:	8b 45 08             	mov    0x8(%ebp),%eax
  102979:	89 04 24             	mov    %eax,(%esp)
  10297c:	e8 38 ff ff ff       	call   1028b9 <printnum>
  102981:	eb 1c                	jmp    10299f <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102983:	8b 45 0c             	mov    0xc(%ebp),%eax
  102986:	89 44 24 04          	mov    %eax,0x4(%esp)
  10298a:	8b 45 20             	mov    0x20(%ebp),%eax
  10298d:	89 04 24             	mov    %eax,(%esp)
  102990:	8b 45 08             	mov    0x8(%ebp),%eax
  102993:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102995:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102999:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10299d:	7f e4                	jg     102983 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10299f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1029a2:	05 90 3b 10 00       	add    $0x103b90,%eax
  1029a7:	0f b6 00             	movzbl (%eax),%eax
  1029aa:	0f be c0             	movsbl %al,%eax
  1029ad:	8b 55 0c             	mov    0xc(%ebp),%edx
  1029b0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1029b4:	89 04 24             	mov    %eax,(%esp)
  1029b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ba:	ff d0                	call   *%eax
}
  1029bc:	c9                   	leave  
  1029bd:	c3                   	ret    

001029be <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1029be:	55                   	push   %ebp
  1029bf:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1029c1:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1029c5:	7e 14                	jle    1029db <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  1029c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ca:	8b 00                	mov    (%eax),%eax
  1029cc:	8d 48 08             	lea    0x8(%eax),%ecx
  1029cf:	8b 55 08             	mov    0x8(%ebp),%edx
  1029d2:	89 0a                	mov    %ecx,(%edx)
  1029d4:	8b 50 04             	mov    0x4(%eax),%edx
  1029d7:	8b 00                	mov    (%eax),%eax
  1029d9:	eb 30                	jmp    102a0b <getuint+0x4d>
    }
    else if (lflag) {
  1029db:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1029df:	74 16                	je     1029f7 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1029e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e4:	8b 00                	mov    (%eax),%eax
  1029e6:	8d 48 04             	lea    0x4(%eax),%ecx
  1029e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1029ec:	89 0a                	mov    %ecx,(%edx)
  1029ee:	8b 00                	mov    (%eax),%eax
  1029f0:	ba 00 00 00 00       	mov    $0x0,%edx
  1029f5:	eb 14                	jmp    102a0b <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1029f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fa:	8b 00                	mov    (%eax),%eax
  1029fc:	8d 48 04             	lea    0x4(%eax),%ecx
  1029ff:	8b 55 08             	mov    0x8(%ebp),%edx
  102a02:	89 0a                	mov    %ecx,(%edx)
  102a04:	8b 00                	mov    (%eax),%eax
  102a06:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102a0b:	5d                   	pop    %ebp
  102a0c:	c3                   	ret    

00102a0d <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102a0d:	55                   	push   %ebp
  102a0e:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a10:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a14:	7e 14                	jle    102a2a <getint+0x1d>
        return va_arg(*ap, long long);
  102a16:	8b 45 08             	mov    0x8(%ebp),%eax
  102a19:	8b 00                	mov    (%eax),%eax
  102a1b:	8d 48 08             	lea    0x8(%eax),%ecx
  102a1e:	8b 55 08             	mov    0x8(%ebp),%edx
  102a21:	89 0a                	mov    %ecx,(%edx)
  102a23:	8b 50 04             	mov    0x4(%eax),%edx
  102a26:	8b 00                	mov    (%eax),%eax
  102a28:	eb 28                	jmp    102a52 <getint+0x45>
    }
    else if (lflag) {
  102a2a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a2e:	74 12                	je     102a42 <getint+0x35>
        return va_arg(*ap, long);
  102a30:	8b 45 08             	mov    0x8(%ebp),%eax
  102a33:	8b 00                	mov    (%eax),%eax
  102a35:	8d 48 04             	lea    0x4(%eax),%ecx
  102a38:	8b 55 08             	mov    0x8(%ebp),%edx
  102a3b:	89 0a                	mov    %ecx,(%edx)
  102a3d:	8b 00                	mov    (%eax),%eax
  102a3f:	99                   	cltd   
  102a40:	eb 10                	jmp    102a52 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102a42:	8b 45 08             	mov    0x8(%ebp),%eax
  102a45:	8b 00                	mov    (%eax),%eax
  102a47:	8d 48 04             	lea    0x4(%eax),%ecx
  102a4a:	8b 55 08             	mov    0x8(%ebp),%edx
  102a4d:	89 0a                	mov    %ecx,(%edx)
  102a4f:	8b 00                	mov    (%eax),%eax
  102a51:	99                   	cltd   
    }
}
  102a52:	5d                   	pop    %ebp
  102a53:	c3                   	ret    

00102a54 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102a54:	55                   	push   %ebp
  102a55:	89 e5                	mov    %esp,%ebp
  102a57:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102a5a:	8d 45 14             	lea    0x14(%ebp),%eax
  102a5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a63:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102a67:	8b 45 10             	mov    0x10(%ebp),%eax
  102a6a:	89 44 24 08          	mov    %eax,0x8(%esp)
  102a6e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a75:	8b 45 08             	mov    0x8(%ebp),%eax
  102a78:	89 04 24             	mov    %eax,(%esp)
  102a7b:	e8 02 00 00 00       	call   102a82 <vprintfmt>
    va_end(ap);
}
  102a80:	c9                   	leave  
  102a81:	c3                   	ret    

00102a82 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102a82:	55                   	push   %ebp
  102a83:	89 e5                	mov    %esp,%ebp
  102a85:	56                   	push   %esi
  102a86:	53                   	push   %ebx
  102a87:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102a8a:	eb 18                	jmp    102aa4 <vprintfmt+0x22>
            if (ch == '\0') {
  102a8c:	85 db                	test   %ebx,%ebx
  102a8e:	75 05                	jne    102a95 <vprintfmt+0x13>
                return;
  102a90:	e9 d1 03 00 00       	jmp    102e66 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102a95:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a98:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a9c:	89 1c 24             	mov    %ebx,(%esp)
  102a9f:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa2:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102aa4:	8b 45 10             	mov    0x10(%ebp),%eax
  102aa7:	8d 50 01             	lea    0x1(%eax),%edx
  102aaa:	89 55 10             	mov    %edx,0x10(%ebp)
  102aad:	0f b6 00             	movzbl (%eax),%eax
  102ab0:	0f b6 d8             	movzbl %al,%ebx
  102ab3:	83 fb 25             	cmp    $0x25,%ebx
  102ab6:	75 d4                	jne    102a8c <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102ab8:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102abc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102ac3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ac6:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102ac9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102ad0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ad3:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102ad6:	8b 45 10             	mov    0x10(%ebp),%eax
  102ad9:	8d 50 01             	lea    0x1(%eax),%edx
  102adc:	89 55 10             	mov    %edx,0x10(%ebp)
  102adf:	0f b6 00             	movzbl (%eax),%eax
  102ae2:	0f b6 d8             	movzbl %al,%ebx
  102ae5:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102ae8:	83 f8 55             	cmp    $0x55,%eax
  102aeb:	0f 87 44 03 00 00    	ja     102e35 <vprintfmt+0x3b3>
  102af1:	8b 04 85 b4 3b 10 00 	mov    0x103bb4(,%eax,4),%eax
  102af8:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102afa:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102afe:	eb d6                	jmp    102ad6 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102b00:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102b04:	eb d0                	jmp    102ad6 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b06:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102b0d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b10:	89 d0                	mov    %edx,%eax
  102b12:	c1 e0 02             	shl    $0x2,%eax
  102b15:	01 d0                	add    %edx,%eax
  102b17:	01 c0                	add    %eax,%eax
  102b19:	01 d8                	add    %ebx,%eax
  102b1b:	83 e8 30             	sub    $0x30,%eax
  102b1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102b21:	8b 45 10             	mov    0x10(%ebp),%eax
  102b24:	0f b6 00             	movzbl (%eax),%eax
  102b27:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102b2a:	83 fb 2f             	cmp    $0x2f,%ebx
  102b2d:	7e 0b                	jle    102b3a <vprintfmt+0xb8>
  102b2f:	83 fb 39             	cmp    $0x39,%ebx
  102b32:	7f 06                	jg     102b3a <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b34:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102b38:	eb d3                	jmp    102b0d <vprintfmt+0x8b>
            goto process_precision;
  102b3a:	eb 33                	jmp    102b6f <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102b3c:	8b 45 14             	mov    0x14(%ebp),%eax
  102b3f:	8d 50 04             	lea    0x4(%eax),%edx
  102b42:	89 55 14             	mov    %edx,0x14(%ebp)
  102b45:	8b 00                	mov    (%eax),%eax
  102b47:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102b4a:	eb 23                	jmp    102b6f <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102b4c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b50:	79 0c                	jns    102b5e <vprintfmt+0xdc>
                width = 0;
  102b52:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102b59:	e9 78 ff ff ff       	jmp    102ad6 <vprintfmt+0x54>
  102b5e:	e9 73 ff ff ff       	jmp    102ad6 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102b63:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102b6a:	e9 67 ff ff ff       	jmp    102ad6 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102b6f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b73:	79 12                	jns    102b87 <vprintfmt+0x105>
                width = precision, precision = -1;
  102b75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b78:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102b7b:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102b82:	e9 4f ff ff ff       	jmp    102ad6 <vprintfmt+0x54>
  102b87:	e9 4a ff ff ff       	jmp    102ad6 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102b8c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102b90:	e9 41 ff ff ff       	jmp    102ad6 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102b95:	8b 45 14             	mov    0x14(%ebp),%eax
  102b98:	8d 50 04             	lea    0x4(%eax),%edx
  102b9b:	89 55 14             	mov    %edx,0x14(%ebp)
  102b9e:	8b 00                	mov    (%eax),%eax
  102ba0:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ba3:	89 54 24 04          	mov    %edx,0x4(%esp)
  102ba7:	89 04 24             	mov    %eax,(%esp)
  102baa:	8b 45 08             	mov    0x8(%ebp),%eax
  102bad:	ff d0                	call   *%eax
            break;
  102baf:	e9 ac 02 00 00       	jmp    102e60 <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102bb4:	8b 45 14             	mov    0x14(%ebp),%eax
  102bb7:	8d 50 04             	lea    0x4(%eax),%edx
  102bba:	89 55 14             	mov    %edx,0x14(%ebp)
  102bbd:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102bbf:	85 db                	test   %ebx,%ebx
  102bc1:	79 02                	jns    102bc5 <vprintfmt+0x143>
                err = -err;
  102bc3:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102bc5:	83 fb 06             	cmp    $0x6,%ebx
  102bc8:	7f 0b                	jg     102bd5 <vprintfmt+0x153>
  102bca:	8b 34 9d 74 3b 10 00 	mov    0x103b74(,%ebx,4),%esi
  102bd1:	85 f6                	test   %esi,%esi
  102bd3:	75 23                	jne    102bf8 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102bd5:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102bd9:	c7 44 24 08 a1 3b 10 	movl   $0x103ba1,0x8(%esp)
  102be0:	00 
  102be1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102be4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102be8:	8b 45 08             	mov    0x8(%ebp),%eax
  102beb:	89 04 24             	mov    %eax,(%esp)
  102bee:	e8 61 fe ff ff       	call   102a54 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102bf3:	e9 68 02 00 00       	jmp    102e60 <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102bf8:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102bfc:	c7 44 24 08 aa 3b 10 	movl   $0x103baa,0x8(%esp)
  102c03:	00 
  102c04:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c07:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c0b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0e:	89 04 24             	mov    %eax,(%esp)
  102c11:	e8 3e fe ff ff       	call   102a54 <printfmt>
            }
            break;
  102c16:	e9 45 02 00 00       	jmp    102e60 <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102c1b:	8b 45 14             	mov    0x14(%ebp),%eax
  102c1e:	8d 50 04             	lea    0x4(%eax),%edx
  102c21:	89 55 14             	mov    %edx,0x14(%ebp)
  102c24:	8b 30                	mov    (%eax),%esi
  102c26:	85 f6                	test   %esi,%esi
  102c28:	75 05                	jne    102c2f <vprintfmt+0x1ad>
                p = "(null)";
  102c2a:	be ad 3b 10 00       	mov    $0x103bad,%esi
            }
            if (width > 0 && padc != '-') {
  102c2f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c33:	7e 3e                	jle    102c73 <vprintfmt+0x1f1>
  102c35:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102c39:	74 38                	je     102c73 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c3b:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102c3e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c41:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c45:	89 34 24             	mov    %esi,(%esp)
  102c48:	e8 15 03 00 00       	call   102f62 <strnlen>
  102c4d:	29 c3                	sub    %eax,%ebx
  102c4f:	89 d8                	mov    %ebx,%eax
  102c51:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c54:	eb 17                	jmp    102c6d <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102c56:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102c5a:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c5d:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c61:	89 04 24             	mov    %eax,(%esp)
  102c64:	8b 45 08             	mov    0x8(%ebp),%eax
  102c67:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c69:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102c6d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c71:	7f e3                	jg     102c56 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102c73:	eb 38                	jmp    102cad <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102c75:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102c79:	74 1f                	je     102c9a <vprintfmt+0x218>
  102c7b:	83 fb 1f             	cmp    $0x1f,%ebx
  102c7e:	7e 05                	jle    102c85 <vprintfmt+0x203>
  102c80:	83 fb 7e             	cmp    $0x7e,%ebx
  102c83:	7e 15                	jle    102c9a <vprintfmt+0x218>
                    putch('?', putdat);
  102c85:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c88:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c8c:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102c93:	8b 45 08             	mov    0x8(%ebp),%eax
  102c96:	ff d0                	call   *%eax
  102c98:	eb 0f                	jmp    102ca9 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c9d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ca1:	89 1c 24             	mov    %ebx,(%esp)
  102ca4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca7:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102ca9:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cad:	89 f0                	mov    %esi,%eax
  102caf:	8d 70 01             	lea    0x1(%eax),%esi
  102cb2:	0f b6 00             	movzbl (%eax),%eax
  102cb5:	0f be d8             	movsbl %al,%ebx
  102cb8:	85 db                	test   %ebx,%ebx
  102cba:	74 10                	je     102ccc <vprintfmt+0x24a>
  102cbc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102cc0:	78 b3                	js     102c75 <vprintfmt+0x1f3>
  102cc2:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102cc6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102cca:	79 a9                	jns    102c75 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102ccc:	eb 17                	jmp    102ce5 <vprintfmt+0x263>
                putch(' ', putdat);
  102cce:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cd1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cd5:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102cdc:	8b 45 08             	mov    0x8(%ebp),%eax
  102cdf:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102ce1:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ce5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ce9:	7f e3                	jg     102cce <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102ceb:	e9 70 01 00 00       	jmp    102e60 <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102cf0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cf3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cf7:	8d 45 14             	lea    0x14(%ebp),%eax
  102cfa:	89 04 24             	mov    %eax,(%esp)
  102cfd:	e8 0b fd ff ff       	call   102a0d <getint>
  102d02:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d05:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102d08:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d0e:	85 d2                	test   %edx,%edx
  102d10:	79 26                	jns    102d38 <vprintfmt+0x2b6>
                putch('-', putdat);
  102d12:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d15:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d19:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102d20:	8b 45 08             	mov    0x8(%ebp),%eax
  102d23:	ff d0                	call   *%eax
                num = -(long long)num;
  102d25:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d28:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d2b:	f7 d8                	neg    %eax
  102d2d:	83 d2 00             	adc    $0x0,%edx
  102d30:	f7 da                	neg    %edx
  102d32:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d35:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102d38:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d3f:	e9 a8 00 00 00       	jmp    102dec <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102d44:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d47:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d4b:	8d 45 14             	lea    0x14(%ebp),%eax
  102d4e:	89 04 24             	mov    %eax,(%esp)
  102d51:	e8 68 fc ff ff       	call   1029be <getuint>
  102d56:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d59:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102d5c:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d63:	e9 84 00 00 00       	jmp    102dec <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102d68:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d6f:	8d 45 14             	lea    0x14(%ebp),%eax
  102d72:	89 04 24             	mov    %eax,(%esp)
  102d75:	e8 44 fc ff ff       	call   1029be <getuint>
  102d7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d7d:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102d80:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102d87:	eb 63                	jmp    102dec <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102d89:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d90:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102d97:	8b 45 08             	mov    0x8(%ebp),%eax
  102d9a:	ff d0                	call   *%eax
            putch('x', putdat);
  102d9c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d9f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102da3:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102daa:	8b 45 08             	mov    0x8(%ebp),%eax
  102dad:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102daf:	8b 45 14             	mov    0x14(%ebp),%eax
  102db2:	8d 50 04             	lea    0x4(%eax),%edx
  102db5:	89 55 14             	mov    %edx,0x14(%ebp)
  102db8:	8b 00                	mov    (%eax),%eax
  102dba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dbd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102dc4:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102dcb:	eb 1f                	jmp    102dec <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102dcd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dd4:	8d 45 14             	lea    0x14(%ebp),%eax
  102dd7:	89 04 24             	mov    %eax,(%esp)
  102dda:	e8 df fb ff ff       	call   1029be <getuint>
  102ddf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102de2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102de5:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102dec:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102df0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102df3:	89 54 24 18          	mov    %edx,0x18(%esp)
  102df7:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102dfa:	89 54 24 14          	mov    %edx,0x14(%esp)
  102dfe:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e02:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e05:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e08:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e0c:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e10:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e13:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e17:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1a:	89 04 24             	mov    %eax,(%esp)
  102e1d:	e8 97 fa ff ff       	call   1028b9 <printnum>
            break;
  102e22:	eb 3c                	jmp    102e60 <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102e24:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e27:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e2b:	89 1c 24             	mov    %ebx,(%esp)
  102e2e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e31:	ff d0                	call   *%eax
            break;
  102e33:	eb 2b                	jmp    102e60 <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102e35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e38:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e3c:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102e43:	8b 45 08             	mov    0x8(%ebp),%eax
  102e46:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102e48:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e4c:	eb 04                	jmp    102e52 <vprintfmt+0x3d0>
  102e4e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e52:	8b 45 10             	mov    0x10(%ebp),%eax
  102e55:	83 e8 01             	sub    $0x1,%eax
  102e58:	0f b6 00             	movzbl (%eax),%eax
  102e5b:	3c 25                	cmp    $0x25,%al
  102e5d:	75 ef                	jne    102e4e <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102e5f:	90                   	nop
        }
    }
  102e60:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e61:	e9 3e fc ff ff       	jmp    102aa4 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102e66:	83 c4 40             	add    $0x40,%esp
  102e69:	5b                   	pop    %ebx
  102e6a:	5e                   	pop    %esi
  102e6b:	5d                   	pop    %ebp
  102e6c:	c3                   	ret    

00102e6d <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102e6d:	55                   	push   %ebp
  102e6e:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102e70:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e73:	8b 40 08             	mov    0x8(%eax),%eax
  102e76:	8d 50 01             	lea    0x1(%eax),%edx
  102e79:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e7c:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102e7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e82:	8b 10                	mov    (%eax),%edx
  102e84:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e87:	8b 40 04             	mov    0x4(%eax),%eax
  102e8a:	39 c2                	cmp    %eax,%edx
  102e8c:	73 12                	jae    102ea0 <sprintputch+0x33>
        *b->buf ++ = ch;
  102e8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e91:	8b 00                	mov    (%eax),%eax
  102e93:	8d 48 01             	lea    0x1(%eax),%ecx
  102e96:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e99:	89 0a                	mov    %ecx,(%edx)
  102e9b:	8b 55 08             	mov    0x8(%ebp),%edx
  102e9e:	88 10                	mov    %dl,(%eax)
    }
}
  102ea0:	5d                   	pop    %ebp
  102ea1:	c3                   	ret    

00102ea2 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102ea2:	55                   	push   %ebp
  102ea3:	89 e5                	mov    %esp,%ebp
  102ea5:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102ea8:	8d 45 14             	lea    0x14(%ebp),%eax
  102eab:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102eae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eb1:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102eb5:	8b 45 10             	mov    0x10(%ebp),%eax
  102eb8:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ebc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ebf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec6:	89 04 24             	mov    %eax,(%esp)
  102ec9:	e8 08 00 00 00       	call   102ed6 <vsnprintf>
  102ece:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102ed1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102ed4:	c9                   	leave  
  102ed5:	c3                   	ret    

00102ed6 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102ed6:	55                   	push   %ebp
  102ed7:	89 e5                	mov    %esp,%ebp
  102ed9:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102edc:	8b 45 08             	mov    0x8(%ebp),%eax
  102edf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ee2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ee5:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ee8:	8b 45 08             	mov    0x8(%ebp),%eax
  102eeb:	01 d0                	add    %edx,%eax
  102eed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ef0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102ef7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102efb:	74 0a                	je     102f07 <vsnprintf+0x31>
  102efd:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f00:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f03:	39 c2                	cmp    %eax,%edx
  102f05:	76 07                	jbe    102f0e <vsnprintf+0x38>
        return -E_INVAL;
  102f07:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102f0c:	eb 2a                	jmp    102f38 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102f0e:	8b 45 14             	mov    0x14(%ebp),%eax
  102f11:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f15:	8b 45 10             	mov    0x10(%ebp),%eax
  102f18:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f1c:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102f1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f23:	c7 04 24 6d 2e 10 00 	movl   $0x102e6d,(%esp)
  102f2a:	e8 53 fb ff ff       	call   102a82 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102f2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f32:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102f35:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f38:	c9                   	leave  
  102f39:	c3                   	ret    

00102f3a <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102f3a:	55                   	push   %ebp
  102f3b:	89 e5                	mov    %esp,%ebp
  102f3d:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f40:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102f47:	eb 04                	jmp    102f4d <strlen+0x13>
        cnt ++;
  102f49:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102f4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102f50:	8d 50 01             	lea    0x1(%eax),%edx
  102f53:	89 55 08             	mov    %edx,0x8(%ebp)
  102f56:	0f b6 00             	movzbl (%eax),%eax
  102f59:	84 c0                	test   %al,%al
  102f5b:	75 ec                	jne    102f49 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102f5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f60:	c9                   	leave  
  102f61:	c3                   	ret    

00102f62 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102f62:	55                   	push   %ebp
  102f63:	89 e5                	mov    %esp,%ebp
  102f65:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f68:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102f6f:	eb 04                	jmp    102f75 <strnlen+0x13>
        cnt ++;
  102f71:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102f75:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f78:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102f7b:	73 10                	jae    102f8d <strnlen+0x2b>
  102f7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102f80:	8d 50 01             	lea    0x1(%eax),%edx
  102f83:	89 55 08             	mov    %edx,0x8(%ebp)
  102f86:	0f b6 00             	movzbl (%eax),%eax
  102f89:	84 c0                	test   %al,%al
  102f8b:	75 e4                	jne    102f71 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102f8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f90:	c9                   	leave  
  102f91:	c3                   	ret    

00102f92 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102f92:	55                   	push   %ebp
  102f93:	89 e5                	mov    %esp,%ebp
  102f95:	57                   	push   %edi
  102f96:	56                   	push   %esi
  102f97:	83 ec 20             	sub    $0x20,%esp
  102f9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fa0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fa3:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102fa6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102fac:	89 d1                	mov    %edx,%ecx
  102fae:	89 c2                	mov    %eax,%edx
  102fb0:	89 ce                	mov    %ecx,%esi
  102fb2:	89 d7                	mov    %edx,%edi
  102fb4:	ac                   	lods   %ds:(%esi),%al
  102fb5:	aa                   	stos   %al,%es:(%edi)
  102fb6:	84 c0                	test   %al,%al
  102fb8:	75 fa                	jne    102fb4 <strcpy+0x22>
  102fba:	89 fa                	mov    %edi,%edx
  102fbc:	89 f1                	mov    %esi,%ecx
  102fbe:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102fc1:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102fc4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102fc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102fca:	83 c4 20             	add    $0x20,%esp
  102fcd:	5e                   	pop    %esi
  102fce:	5f                   	pop    %edi
  102fcf:	5d                   	pop    %ebp
  102fd0:	c3                   	ret    

00102fd1 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102fd1:	55                   	push   %ebp
  102fd2:	89 e5                	mov    %esp,%ebp
  102fd4:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102fd7:	8b 45 08             	mov    0x8(%ebp),%eax
  102fda:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102fdd:	eb 21                	jmp    103000 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102fdf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fe2:	0f b6 10             	movzbl (%eax),%edx
  102fe5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102fe8:	88 10                	mov    %dl,(%eax)
  102fea:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102fed:	0f b6 00             	movzbl (%eax),%eax
  102ff0:	84 c0                	test   %al,%al
  102ff2:	74 04                	je     102ff8 <strncpy+0x27>
            src ++;
  102ff4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102ff8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102ffc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  103000:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103004:	75 d9                	jne    102fdf <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  103006:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103009:	c9                   	leave  
  10300a:	c3                   	ret    

0010300b <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10300b:	55                   	push   %ebp
  10300c:	89 e5                	mov    %esp,%ebp
  10300e:	57                   	push   %edi
  10300f:	56                   	push   %esi
  103010:	83 ec 20             	sub    $0x20,%esp
  103013:	8b 45 08             	mov    0x8(%ebp),%eax
  103016:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103019:	8b 45 0c             	mov    0xc(%ebp),%eax
  10301c:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  10301f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103022:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103025:	89 d1                	mov    %edx,%ecx
  103027:	89 c2                	mov    %eax,%edx
  103029:	89 ce                	mov    %ecx,%esi
  10302b:	89 d7                	mov    %edx,%edi
  10302d:	ac                   	lods   %ds:(%esi),%al
  10302e:	ae                   	scas   %es:(%edi),%al
  10302f:	75 08                	jne    103039 <strcmp+0x2e>
  103031:	84 c0                	test   %al,%al
  103033:	75 f8                	jne    10302d <strcmp+0x22>
  103035:	31 c0                	xor    %eax,%eax
  103037:	eb 04                	jmp    10303d <strcmp+0x32>
  103039:	19 c0                	sbb    %eax,%eax
  10303b:	0c 01                	or     $0x1,%al
  10303d:	89 fa                	mov    %edi,%edx
  10303f:	89 f1                	mov    %esi,%ecx
  103041:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103044:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103047:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  10304a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10304d:	83 c4 20             	add    $0x20,%esp
  103050:	5e                   	pop    %esi
  103051:	5f                   	pop    %edi
  103052:	5d                   	pop    %ebp
  103053:	c3                   	ret    

00103054 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103054:	55                   	push   %ebp
  103055:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103057:	eb 0c                	jmp    103065 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103059:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10305d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103061:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103065:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103069:	74 1a                	je     103085 <strncmp+0x31>
  10306b:	8b 45 08             	mov    0x8(%ebp),%eax
  10306e:	0f b6 00             	movzbl (%eax),%eax
  103071:	84 c0                	test   %al,%al
  103073:	74 10                	je     103085 <strncmp+0x31>
  103075:	8b 45 08             	mov    0x8(%ebp),%eax
  103078:	0f b6 10             	movzbl (%eax),%edx
  10307b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10307e:	0f b6 00             	movzbl (%eax),%eax
  103081:	38 c2                	cmp    %al,%dl
  103083:	74 d4                	je     103059 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103085:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103089:	74 18                	je     1030a3 <strncmp+0x4f>
  10308b:	8b 45 08             	mov    0x8(%ebp),%eax
  10308e:	0f b6 00             	movzbl (%eax),%eax
  103091:	0f b6 d0             	movzbl %al,%edx
  103094:	8b 45 0c             	mov    0xc(%ebp),%eax
  103097:	0f b6 00             	movzbl (%eax),%eax
  10309a:	0f b6 c0             	movzbl %al,%eax
  10309d:	29 c2                	sub    %eax,%edx
  10309f:	89 d0                	mov    %edx,%eax
  1030a1:	eb 05                	jmp    1030a8 <strncmp+0x54>
  1030a3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030a8:	5d                   	pop    %ebp
  1030a9:	c3                   	ret    

001030aa <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1030aa:	55                   	push   %ebp
  1030ab:	89 e5                	mov    %esp,%ebp
  1030ad:	83 ec 04             	sub    $0x4,%esp
  1030b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030b3:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030b6:	eb 14                	jmp    1030cc <strchr+0x22>
        if (*s == c) {
  1030b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030bb:	0f b6 00             	movzbl (%eax),%eax
  1030be:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1030c1:	75 05                	jne    1030c8 <strchr+0x1e>
            return (char *)s;
  1030c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c6:	eb 13                	jmp    1030db <strchr+0x31>
        }
        s ++;
  1030c8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1030cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cf:	0f b6 00             	movzbl (%eax),%eax
  1030d2:	84 c0                	test   %al,%al
  1030d4:	75 e2                	jne    1030b8 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1030d6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030db:	c9                   	leave  
  1030dc:	c3                   	ret    

001030dd <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1030dd:	55                   	push   %ebp
  1030de:	89 e5                	mov    %esp,%ebp
  1030e0:	83 ec 04             	sub    $0x4,%esp
  1030e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e6:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030e9:	eb 11                	jmp    1030fc <strfind+0x1f>
        if (*s == c) {
  1030eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ee:	0f b6 00             	movzbl (%eax),%eax
  1030f1:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1030f4:	75 02                	jne    1030f8 <strfind+0x1b>
            break;
  1030f6:	eb 0e                	jmp    103106 <strfind+0x29>
        }
        s ++;
  1030f8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  1030fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ff:	0f b6 00             	movzbl (%eax),%eax
  103102:	84 c0                	test   %al,%al
  103104:	75 e5                	jne    1030eb <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  103106:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103109:	c9                   	leave  
  10310a:	c3                   	ret    

0010310b <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  10310b:	55                   	push   %ebp
  10310c:	89 e5                	mov    %esp,%ebp
  10310e:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103111:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103118:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10311f:	eb 04                	jmp    103125 <strtol+0x1a>
        s ++;
  103121:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103125:	8b 45 08             	mov    0x8(%ebp),%eax
  103128:	0f b6 00             	movzbl (%eax),%eax
  10312b:	3c 20                	cmp    $0x20,%al
  10312d:	74 f2                	je     103121 <strtol+0x16>
  10312f:	8b 45 08             	mov    0x8(%ebp),%eax
  103132:	0f b6 00             	movzbl (%eax),%eax
  103135:	3c 09                	cmp    $0x9,%al
  103137:	74 e8                	je     103121 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103139:	8b 45 08             	mov    0x8(%ebp),%eax
  10313c:	0f b6 00             	movzbl (%eax),%eax
  10313f:	3c 2b                	cmp    $0x2b,%al
  103141:	75 06                	jne    103149 <strtol+0x3e>
        s ++;
  103143:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103147:	eb 15                	jmp    10315e <strtol+0x53>
    }
    else if (*s == '-') {
  103149:	8b 45 08             	mov    0x8(%ebp),%eax
  10314c:	0f b6 00             	movzbl (%eax),%eax
  10314f:	3c 2d                	cmp    $0x2d,%al
  103151:	75 0b                	jne    10315e <strtol+0x53>
        s ++, neg = 1;
  103153:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103157:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10315e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103162:	74 06                	je     10316a <strtol+0x5f>
  103164:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103168:	75 24                	jne    10318e <strtol+0x83>
  10316a:	8b 45 08             	mov    0x8(%ebp),%eax
  10316d:	0f b6 00             	movzbl (%eax),%eax
  103170:	3c 30                	cmp    $0x30,%al
  103172:	75 1a                	jne    10318e <strtol+0x83>
  103174:	8b 45 08             	mov    0x8(%ebp),%eax
  103177:	83 c0 01             	add    $0x1,%eax
  10317a:	0f b6 00             	movzbl (%eax),%eax
  10317d:	3c 78                	cmp    $0x78,%al
  10317f:	75 0d                	jne    10318e <strtol+0x83>
        s += 2, base = 16;
  103181:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103185:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10318c:	eb 2a                	jmp    1031b8 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  10318e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103192:	75 17                	jne    1031ab <strtol+0xa0>
  103194:	8b 45 08             	mov    0x8(%ebp),%eax
  103197:	0f b6 00             	movzbl (%eax),%eax
  10319a:	3c 30                	cmp    $0x30,%al
  10319c:	75 0d                	jne    1031ab <strtol+0xa0>
        s ++, base = 8;
  10319e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031a2:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1031a9:	eb 0d                	jmp    1031b8 <strtol+0xad>
    }
    else if (base == 0) {
  1031ab:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031af:	75 07                	jne    1031b8 <strtol+0xad>
        base = 10;
  1031b1:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1031b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031bb:	0f b6 00             	movzbl (%eax),%eax
  1031be:	3c 2f                	cmp    $0x2f,%al
  1031c0:	7e 1b                	jle    1031dd <strtol+0xd2>
  1031c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c5:	0f b6 00             	movzbl (%eax),%eax
  1031c8:	3c 39                	cmp    $0x39,%al
  1031ca:	7f 11                	jg     1031dd <strtol+0xd2>
            dig = *s - '0';
  1031cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1031cf:	0f b6 00             	movzbl (%eax),%eax
  1031d2:	0f be c0             	movsbl %al,%eax
  1031d5:	83 e8 30             	sub    $0x30,%eax
  1031d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1031db:	eb 48                	jmp    103225 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1031dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e0:	0f b6 00             	movzbl (%eax),%eax
  1031e3:	3c 60                	cmp    $0x60,%al
  1031e5:	7e 1b                	jle    103202 <strtol+0xf7>
  1031e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ea:	0f b6 00             	movzbl (%eax),%eax
  1031ed:	3c 7a                	cmp    $0x7a,%al
  1031ef:	7f 11                	jg     103202 <strtol+0xf7>
            dig = *s - 'a' + 10;
  1031f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f4:	0f b6 00             	movzbl (%eax),%eax
  1031f7:	0f be c0             	movsbl %al,%eax
  1031fa:	83 e8 57             	sub    $0x57,%eax
  1031fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103200:	eb 23                	jmp    103225 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103202:	8b 45 08             	mov    0x8(%ebp),%eax
  103205:	0f b6 00             	movzbl (%eax),%eax
  103208:	3c 40                	cmp    $0x40,%al
  10320a:	7e 3d                	jle    103249 <strtol+0x13e>
  10320c:	8b 45 08             	mov    0x8(%ebp),%eax
  10320f:	0f b6 00             	movzbl (%eax),%eax
  103212:	3c 5a                	cmp    $0x5a,%al
  103214:	7f 33                	jg     103249 <strtol+0x13e>
            dig = *s - 'A' + 10;
  103216:	8b 45 08             	mov    0x8(%ebp),%eax
  103219:	0f b6 00             	movzbl (%eax),%eax
  10321c:	0f be c0             	movsbl %al,%eax
  10321f:	83 e8 37             	sub    $0x37,%eax
  103222:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103225:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103228:	3b 45 10             	cmp    0x10(%ebp),%eax
  10322b:	7c 02                	jl     10322f <strtol+0x124>
            break;
  10322d:	eb 1a                	jmp    103249 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  10322f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103233:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103236:	0f af 45 10          	imul   0x10(%ebp),%eax
  10323a:	89 c2                	mov    %eax,%edx
  10323c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10323f:	01 d0                	add    %edx,%eax
  103241:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103244:	e9 6f ff ff ff       	jmp    1031b8 <strtol+0xad>

    if (endptr) {
  103249:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10324d:	74 08                	je     103257 <strtol+0x14c>
        *endptr = (char *) s;
  10324f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103252:	8b 55 08             	mov    0x8(%ebp),%edx
  103255:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103257:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10325b:	74 07                	je     103264 <strtol+0x159>
  10325d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103260:	f7 d8                	neg    %eax
  103262:	eb 03                	jmp    103267 <strtol+0x15c>
  103264:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103267:	c9                   	leave  
  103268:	c3                   	ret    

00103269 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103269:	55                   	push   %ebp
  10326a:	89 e5                	mov    %esp,%ebp
  10326c:	57                   	push   %edi
  10326d:	83 ec 24             	sub    $0x24,%esp
  103270:	8b 45 0c             	mov    0xc(%ebp),%eax
  103273:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103276:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  10327a:	8b 55 08             	mov    0x8(%ebp),%edx
  10327d:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103280:	88 45 f7             	mov    %al,-0x9(%ebp)
  103283:	8b 45 10             	mov    0x10(%ebp),%eax
  103286:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103289:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10328c:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103290:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103293:	89 d7                	mov    %edx,%edi
  103295:	f3 aa                	rep stos %al,%es:(%edi)
  103297:	89 fa                	mov    %edi,%edx
  103299:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10329c:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10329f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1032a2:	83 c4 24             	add    $0x24,%esp
  1032a5:	5f                   	pop    %edi
  1032a6:	5d                   	pop    %ebp
  1032a7:	c3                   	ret    

001032a8 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1032a8:	55                   	push   %ebp
  1032a9:	89 e5                	mov    %esp,%ebp
  1032ab:	57                   	push   %edi
  1032ac:	56                   	push   %esi
  1032ad:	53                   	push   %ebx
  1032ae:	83 ec 30             	sub    $0x30,%esp
  1032b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1032bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1032c0:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1032c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032c6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1032c9:	73 42                	jae    10330d <memmove+0x65>
  1032cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1032d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1032d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1032da:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1032dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1032e0:	c1 e8 02             	shr    $0x2,%eax
  1032e3:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1032e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1032e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1032eb:	89 d7                	mov    %edx,%edi
  1032ed:	89 c6                	mov    %eax,%esi
  1032ef:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1032f1:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1032f4:	83 e1 03             	and    $0x3,%ecx
  1032f7:	74 02                	je     1032fb <memmove+0x53>
  1032f9:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1032fb:	89 f0                	mov    %esi,%eax
  1032fd:	89 fa                	mov    %edi,%edx
  1032ff:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103302:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103305:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103308:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10330b:	eb 36                	jmp    103343 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10330d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103310:	8d 50 ff             	lea    -0x1(%eax),%edx
  103313:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103316:	01 c2                	add    %eax,%edx
  103318:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10331b:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10331e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103321:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103324:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103327:	89 c1                	mov    %eax,%ecx
  103329:	89 d8                	mov    %ebx,%eax
  10332b:	89 d6                	mov    %edx,%esi
  10332d:	89 c7                	mov    %eax,%edi
  10332f:	fd                   	std    
  103330:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103332:	fc                   	cld    
  103333:	89 f8                	mov    %edi,%eax
  103335:	89 f2                	mov    %esi,%edx
  103337:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10333a:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10333d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  103340:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103343:	83 c4 30             	add    $0x30,%esp
  103346:	5b                   	pop    %ebx
  103347:	5e                   	pop    %esi
  103348:	5f                   	pop    %edi
  103349:	5d                   	pop    %ebp
  10334a:	c3                   	ret    

0010334b <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10334b:	55                   	push   %ebp
  10334c:	89 e5                	mov    %esp,%ebp
  10334e:	57                   	push   %edi
  10334f:	56                   	push   %esi
  103350:	83 ec 20             	sub    $0x20,%esp
  103353:	8b 45 08             	mov    0x8(%ebp),%eax
  103356:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103359:	8b 45 0c             	mov    0xc(%ebp),%eax
  10335c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10335f:	8b 45 10             	mov    0x10(%ebp),%eax
  103362:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103365:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103368:	c1 e8 02             	shr    $0x2,%eax
  10336b:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  10336d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103370:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103373:	89 d7                	mov    %edx,%edi
  103375:	89 c6                	mov    %eax,%esi
  103377:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103379:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10337c:	83 e1 03             	and    $0x3,%ecx
  10337f:	74 02                	je     103383 <memcpy+0x38>
  103381:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103383:	89 f0                	mov    %esi,%eax
  103385:	89 fa                	mov    %edi,%edx
  103387:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10338a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10338d:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103390:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103393:	83 c4 20             	add    $0x20,%esp
  103396:	5e                   	pop    %esi
  103397:	5f                   	pop    %edi
  103398:	5d                   	pop    %ebp
  103399:	c3                   	ret    

0010339a <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  10339a:	55                   	push   %ebp
  10339b:	89 e5                	mov    %esp,%ebp
  10339d:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1033a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1033a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1033ac:	eb 30                	jmp    1033de <memcmp+0x44>
        if (*s1 != *s2) {
  1033ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033b1:	0f b6 10             	movzbl (%eax),%edx
  1033b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033b7:	0f b6 00             	movzbl (%eax),%eax
  1033ba:	38 c2                	cmp    %al,%dl
  1033bc:	74 18                	je     1033d6 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1033be:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033c1:	0f b6 00             	movzbl (%eax),%eax
  1033c4:	0f b6 d0             	movzbl %al,%edx
  1033c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033ca:	0f b6 00             	movzbl (%eax),%eax
  1033cd:	0f b6 c0             	movzbl %al,%eax
  1033d0:	29 c2                	sub    %eax,%edx
  1033d2:	89 d0                	mov    %edx,%eax
  1033d4:	eb 1a                	jmp    1033f0 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  1033d6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1033da:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1033de:	8b 45 10             	mov    0x10(%ebp),%eax
  1033e1:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033e4:	89 55 10             	mov    %edx,0x10(%ebp)
  1033e7:	85 c0                	test   %eax,%eax
  1033e9:	75 c3                	jne    1033ae <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1033eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1033f0:	c9                   	leave  
  1033f1:	c3                   	ret    
