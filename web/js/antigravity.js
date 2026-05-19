// 确保页面加载完毕后再执行
window.onload = function () {
    // 获取 Matter.js 的核心模块
    const Engine = Matter.Engine,
        Render = Matter.Render,
        Runner = Matter.Runner,
        MouseConstraint = Matter.MouseConstraint,
        Mouse = Matter.Mouse,
        World = Matter.World,
        Bodies = Matter.Bodies;

    // 1. 创建物理引擎
    const engine = Engine.create();

    // 【核心秘籍】消除重力，让东西飘起来！
    engine.world.gravity.y = 0;
    engine.world.gravity.x = 0;

    // 2. 创建渲染器
    const canvas = document.getElementById('gravity-canvas');
    const render = Render.create({
        canvas: canvas,
        engine: engine,
        options: {
            width: window.innerWidth,
            height: window.innerHeight,
            background: 'transparent', // 画布背景透明
            wireframes: false // 关闭线框模式，显示实体颜色
        }
    });

    // 3. 制造四周的"隐形墙壁"，防止漂浮物飞出屏幕
    const wallOptions = { isStatic: true, render: { visible: false } };
    World.add(engine.world, [
        Bodies.rectangle(window.innerWidth / 2, -50, window.innerWidth, 100, wallOptions), // 上边
        Bodies.rectangle(window.innerWidth / 2, window.innerHeight + 50, window.innerWidth, 100, wallOptions), // 下边
        Bodies.rectangle(-50, window.innerHeight / 2, 100, window.innerHeight, wallOptions), // 左边
        Bodies.rectangle(window.innerWidth + 50, window.innerHeight / 2, 100, window.innerHeight, wallOptions) // 右边
    ]);

    // 4. 随机生成一堆漂浮的方块和圆球
    const elements = [];
    const colors = ['#88c0d0', '#8fbcbb', '#5e81ac', '#a3be8c', '#ebcb8b']; // 冷色调护眼配色

    for (let i = 0; i < 40; i++) {
        let x = Math.random() * window.innerWidth;
        let y = Math.random() * window.innerHeight;
        let size = Math.random() * 40 + 20; // 尺寸随机
        let color = colors[Math.floor(Math.random() * colors.length)];

        let body;
        if (Math.random() > 0.5) {
            body = Bodies.rectangle(x, y, size, size, {
                restitution: 0.9, // 弹性，让它们碰撞后弹开
                frictionAir: 0.005, // 空气阻力
                render: { fillStyle: color }
            });
        } else {
            body = Bodies.circle(x, y, size / 2, {
                restitution: 0.9,
                frictionAir: 0.005,
                render: { fillStyle: color }
            });
        }

        // 给每个物体一个初始的轻微推力，让它们动起来
        Matter.Body.applyForce(body, body.position, {
            x: (Math.random() - 0.5) * 0.05,
            y: (Math.random() - 0.5) * 0.05
        });

        elements.push(body);
    }
    World.add(engine.world, elements);

    // 5. 添加鼠标交互（可以拖拽和抛掷物体）
    const mouse = Mouse.create(render.canvas);
    const mouseConstraint = MouseConstraint.create(engine, {
        mouse: mouse,
        constraint: {
            stiffness: 0.2,
            render: { visible: false }
        }
    });
    World.add(engine.world, mouseConstraint);

    // 允许鼠标滚动页面不被画布拦截
    render.mouse = mouse;

    // 6. 运行引擎和渲染器
    Render.run(render);
    const runner = Runner.create();
    Runner.run(runner, engine);

    // 7. 当窗口大小改变时，自适应画布大小
    window.addEventListener('resize', () => {
        render.canvas.width = window.innerWidth;
        render.canvas.height = window.innerHeight;
    });
};
